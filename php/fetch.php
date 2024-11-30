<?php
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json"); 
header("Access-Control-Allow-Methods: GET, POST"); 
header("Access-Control-Allow-Headers: Content-Type, Authorization");
include("connect.php");

$id = isset($_GET['id']) ? intval($_GET['id']) : null;

if ($id) {
    // Fetch a single item with claim and turnover details
    $stmt = $conn->prepare("
        SELECT 
            fi.item_id, fi.title, fi.description, fi.date_found, fi.time_found, fi.location_found, 
            fi.category, fi.status, fi.item_img, 
            u.username AS turnover_username, u.email AS turnover_email, 
            cr.status AS claim_status, cu.username AS claimant_username, cu.email AS claimant_email
        FROM found_item AS fi
        LEFT JOIN users AS u ON fi.user_id = u.user_id
        LEFT JOIN claim_requests AS cr ON fi.item_id = cr.item_id
        LEFT JOIN users AS cu ON cr.user_id = cu.user_id
        WHERE fi.item_id = ?
    ");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        echo json_encode($result->fetch_assoc());
    } else {
        echo json_encode(["error" => "Item not found"]);
    }

    $stmt->close();
} else {
    // Fetch all items with claim and turnover details
    $sql = "
        SELECT 
            fi.item_id, fi.title, fi.description, fi.date_found, fi.time_found, fi.location_found, 
            fi.category, fi.status, fi.item_img, 
            u.username AS turnover_username, u.email AS turnover_email, 
            cr.status AS claim_status, cu.username AS claimant_username, cu.email AS claimant_email
        FROM found_item AS fi
        LEFT JOIN users AS u ON fi.user_id = u.user_id
        LEFT JOIN claim_requests AS cr ON fi.item_id = cr.item_id
        LEFT JOIN users AS cu ON cr.user_id = cu.user_id
        ORDER BY fi.date_found DESC
    ";

    $result = $conn->query($sql);

    $items = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $items[] = [
                'item_id' => $row['item_id'],  
                'title' => $row['title'],
                'description' => $row['description'],
                'date_found' => $row['date_found'],
                'time_found' => $row['time_found'],
                'location_found' => $row['location_found'],
                'category' => $row['category'],
                'status' => $row['status'],
                'item_img' => $row['item_img'],
                'turnover_username' => $row['turnover_username'],
                'turnover_email' => $row['turnover_email'],
                'claim_status' => $row['claim_status'] ?? 'Unclaimed',
                'claimant_username' => $row['claimant_username'],
                'claimant_email' => $row['claimant_email']
            ];
        }
    }
    echo json_encode($items);  
}

$conn->close();
?>

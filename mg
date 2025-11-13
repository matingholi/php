<?php
$conn = new mysqli("localhost", "root", "", "save");
if ($conn->connect_error) die("خطا در اتصال به دیتابیس: " . $conn->connect_error);

$result = $conn->query("SELECT * FROM students");
?>

<!DOCTYPE html>
<html lang="fa">
<head>
<meta charset="UTF-8">
<title>لیست دانش‌آموزان</title>
</head>
<body>
<h2>لیست دانش‌آموزان</h2>
<table border="1" cellpadding="5">
<tr>
    <th>شناسه</th>
    <th>نام</th>
    <th>نام خانوادگی</th>
    <th>ثبت نمره</th>
</tr>
<?php while($row = $result->fetch_assoc()): ?>
<tr>
    <td><?php echo $row['id']; ?></td>
    <td><?php echo htmlspecialchars($row['f_name']); ?></td>
    <td><?php echo htmlspecialchars($row['l_name']); ?></td>
    <td><a href="add_grade.php?student_id=<?php echo $row['id']; ?>">ثبت/ویرایش نمره</a></td>
</tr>
<?php endwhile; ?>
</table>
<br>
<a href="add_student.php">ثبت دانش‌آموز جدید</a>
</body>
</html>

<?php $conn->close(); ?>

CREATE DATABASE facultyResearch;
USE facultyResearch;

CREATE TABLE publications3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  abstract TEXT,
  facultyName VARCHAR(255),
  filePath VARCHAR(255),
  department VARCHAR(255)
);


select * from publications3;
CREATE USER 'root'@'localhost' IDENTIFIED BY 'keerthana49';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SHOW TABLES;
SELECT * FROM publications3;
SHOW GRANTS FOR 'root'@'localhost';
USE facultyResearch;

-- Create a new 'researches' table inside the existing database
CREATE TABLE researches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    abstract TEXT NOT NULL,
    facultyName VARCHAR(255) NOT NULL,
    filePath VARCHAR(255),
    department VARCHAR(255),
    uploadedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO researches (title, abstract, facultyName, filePath, department) VALUES
('Performance Comparison of TCP Congestion Control Algorithms', 
 'Comparison of TCP congestion control techniques.', 
 'Dr. P. Chenna Reddy', '/uploads/tcp_congestion.pdf', 'Computer Science'),

('Performance Analysis of Adhoc Network Routing Protocols', 
 'Study of various routing protocols in adhoc networks.', 
 'Dr. P. Chenna Reddy', '/uploads/adhoc_routing.pdf', 'Computer Science'),

('Active Queue Management in a QOS Enabled Network', 
 'Techniques to improve Quality of Service using queue management.', 
 'Dr. P. Chenna Reddy', '/uploads/qos_network.pdf', 'Computer Science'),

('Interoperability of TCP Vegas with TCP Reno', 
 'Analysis on how TCP Vegas interacts with TCP Reno.', 
 'Dr. P. Chenna Reddy', '/uploads/tcp_vegas_vs_reno.pdf', 'Computer Science'),

('Dynamic RED', 
 'A study on dynamic random early detection mechanisms.', 
 'Dr. P. Chenna Reddy', '/uploads/dynamic_red.pdf', 'Computer Science'),

('Energy-Efficient Self-Reconfigurable Clustering Approach for Heterogeneous Wireless Sensor Networks', 
 'A study on clustering approaches for wireless sensor networks.', 
 'Dr. P. Chenna Reddy', '/uploads/energy_wsn.pdf', 'Computer Science'),

('A Novel Technique for JPEG Image Steganography and its Performance Evaluation', 
 'Techniques for hiding information in JPEG images.', 
 'Dr. P. Chenna Reddy', '/uploads/jpeg_steganography.pdf', 'Computer Science'),

('Secure Quantum Key Distribution Protocols in Wireless Networks', 
 'A new security protocol for wireless networks using quantum key distribution.', 
 'Dr. P. Chenna Reddy', '/uploads/quantum_key.pdf', 'Computer Science');
SELECT * FROM researches WHERE facultyName = 'Dr. P. Chenna Reddy';


UPDATE researches SET facultyName = TRIM(REGEXP_REPLACE(facultyName, '[ ]+', ' '));
UPDATE publications3 SET facultyName = TRIM(REGEXP_REPLACE(facultyName, '[ ]+', ' '));
UPDATE researches SET facultyName = TRIM(REPLACE(REPLACE(REPLACE(facultyName, '   ', ' '), '  ', ' '), '  ', ' '));
UPDATE publications3 SET facultyName = TRIM(REPLACE(REPLACE(REPLACE(facultyName, '   ', ' '), '  ', ' '), '  ', ' '));


ALTER TABLE researches MODIFY facultyName VARCHAR(255) COLLATE utf8_general_ci;
ALTER TABLE publications3 MODIFY facultyName VARCHAR(255) COLLATE utf8_general_ci;
SELECT * FROM publications3;
SELECT * FROM researches WHERE facultyName = 'Dr. P. Chenna Reddy';
INSERT INTO publications3 (title, abstract, facultyName, filePath, department) VALUES
('A Novel Technique for JPEG Image Steganography and its Performance Evaluation', 
 'A study on steganography techniques in JPEG images.', 
 'Dr. P. Chenna Reddy', '/uploads/jpeg_steganography.pdf', 'Computer Science'),

('Fuzzy Bee Colony Optimization for Resource Allocation in Grid Computing', 
 'Optimizing resource allocation using fuzzy logic and bee colony methods.', 
 'Dr. P. Chenna Reddy', '/uploads/grid_computing.pdf', 'Computer Science'),

('Power Aware Based Workflow Model Optimization Using Fuzzy Bee Colony Method', 
 'A novel power-aware optimization method using fuzzy bee colony.', 
 'Dr. P. Chenna Reddy', '/uploads/power_aware_fuzzy.pdf', 'Computer Science'),

('Digital Image Watermark Extraction in Discrete Wavelet Transform Domain using Support Vector Machines', 
 'A robust method for watermark extraction using SVMs and DWT.', 
 'Dr. P. Chenna Reddy', '/uploads/image_watermarking.pdf', 'Computer Science'),

('New Routing Metrics for Adhoc Network Routing Protocols', 
 'Developing new metrics to improve adhoc network routing.', 
 'Dr. P. Chenna Reddy', '/uploads/adhoc_routing_metrics.pdf', 'Computer Science'),

('Hadoop Scheduler with Deadline Constraint', 
 'A study on Hadoop schedulers that consider deadline constraints.', 
 'Dr. P. Chenna Reddy', '/uploads/hadoop_scheduler.pdf', 'Computer Science'),

('Power Aware Framework for Scheduling Tasks in Grid-based Workflows', 
 'Proposing an efficient power-aware framework for task scheduling.', 
 'Dr. P. Chenna Reddy', '/uploads/grid_task_scheduling.pdf', 'Computer Science');
 -- shobha bindhu mam  researches 
 INSERT INTO researches (title, abstract, facultyName, filePath, department) VALUES
('A Novel remote login authentication with a smart card', 
 'A new remote login authentication technique using a smart card.', 
 'Dr. C. Shoba Bindu', '/uploads/remote_login_auth.pdf', 'Computer Science'),

('Cryptanalysis of Liao-Lee-Hwang Dynamic-ID Scheme', 
 'Security analysis of the Liao-Lee-Hwang Dynamic-ID Scheme.', 
 'Dr. C. Shoba Bindu', '/uploads/cryptanalysis.pdf', 'Computer Science'),

('Improved remote user authentication scheme preserving user anonymity', 
 'A privacy-enhancing remote user authentication scheme.', 
 'Dr. C. Shoba Bindu', '/uploads/user_authentication.pdf', 'Computer Science'),

('Selfishness Detection and Prevention Schemes for MANETs – A Survey', 
 'A survey on detecting and preventing selfish behavior in MANETs.', 
 'Dr. C. Shoba Bindu', '/uploads/manet_selfishness.pdf', 'Computer Science'),

('Finding Multiple Optimal Paths in Ad Hoc Networks based on QoS metrics', 
 'Routing algorithms for Ad Hoc networks with QoS constraints.', 
 'Dr. C. Shoba Bindu', '/uploads/adhoc_qos_routing.pdf', 'Computer Science'),

('Secure Usable Authentication Using Strong Pass text Passwords', 
 'Proposed strong pass-text password authentication mechanism.', 
 'Dr. C. Shoba Bindu', '/uploads/strong_password_auth.pdf', 'Computer Science');
 -- shobha bindu mam publications 
 INSERT INTO publications3 (title, abstract, facultyName, filePath, department) VALUES
('Security in Ubiquitous Computing Environment: Vulnerabilities, Attacks, and Defenses', 
 'Exploring vulnerabilities and defense mechanisms in ubiquitous computing.', 
 'Dr. C. Shoba Bindu', '/uploads/ubiquitous_computing.pdf', 'Computer Science'),

('Hybridizing Spectral Clustering with Shadow Clustering', 
 'Combining spectral clustering with shadow clustering techniques.', 
 'Dr. C. Shoba Bindu', '/uploads/spectral_clustering.pdf', 'Computer Science'),

('Deep Convolutional Neural Network-Based Analysis for Breast Cancer Histology Images', 
 'Using deep CNNs for breast cancer histology image classification.', 
 'Dr. C. Shoba Bindu', '/uploads/breast_cancer_cnn.pdf', 'Computer Science'),

('Ensuring Security Through Trust in Mobile Ad-Hoc Networks Using Soft Computing Methods', 
 'Using soft computing techniques to enhance MANET security.', 
 'Dr. C. Shoba Bindu', '/uploads/manet_trust_security.pdf', 'Computer Science'),

('Applications and Advancements in Data Science and Analytics', 
 'Discussing applications and future directions in data science.', 
 'Dr. C. Shoba Bindu', '/uploads/data_science_analytics.pdf', 'Computer Science');
-- eshwar reddy publications 
INSERT INTO publications3 (title, abstract, facultyName, filePath, department) VALUES
('Security in Ubiquitous Computing Environment: Vulnerabilities, Attacks, and Defenses', 
 'Exploring vulnerabilities and defense mechanisms in ubiquitous computing.', 
 'Dr. B. Eswara Reddy', '/uploads/ubiquitous_computing.pdf', 'Computer Science'),

('Hybridizing Spectral Clustering with Shadow Clustering', 
 'Combining spectral clustering with shadow clustering techniques.', 
 'Dr. B. Eswara Reddy', '/uploads/spectral_clustering.pdf', 'Computer Science'),

('Deep Convolutional Neural Network-Based Analysis for Breast Cancer Histology Images', 
 'Using deep CNNs for breast cancer histology image classification.', 
 'Dr. B. Eswara Reddy', '/uploads/breast_cancer_cnn.pdf', 'Computer Science'),

('Ensuring Security Through Trust in Mobile Ad-Hoc Networks Using Soft Computing Methods', 
 'Using soft computing techniques to enhance MANET security.', 
 'Dr. B. Eswara Reddy', '/uploads/manet_trust_security.pdf', 'Computer Science'),

('Applications and Advancements in Data Science and Analytics', 
 'Discussing applications and future directions in data science.', 
 'Dr. B. Eswara Reddy', '/uploads/data_science_analytics.pdf', 'Computer Science');
 
-- eshwar reddy researches 
INSERT INTO researches (title, abstract, facultyName, filePath, department) VALUES
('Pixon based image denoising scheme by preserving exact edge locations', 
 'A novel image denoising technique preserving edge details.', 
 'Dr. B. Eswara Reddy', '/uploads/image_denoising.pdf', 'Computer Science'),

('Improving the performance of visualized clustering method', 
 'Enhancing clustering algorithms for improved performance.', 
 'Dr. B. Eswara Reddy', '/uploads/visualized_clustering.pdf', 'Computer Science'),

('Content-Based Image Retrieval Using Multi Region Features', 
 'Feature extraction for efficient image retrieval.', 
 'Dr. B. Eswara Reddy', '/uploads/cbir_multi_region.pdf', 'Computer Science'),

('A Novel LCM2ICM: Low Contrast Malaria Microscopic Image Classification Measure', 
 'Improving malaria image classification in low contrast images.', 
 'Dr. B. Eswara Reddy', '/uploads/malaria_classification.pdf', 'Computer Science'),

('A Novel Two-Stage Thresholding Method for Segmentation of Malaria Parasites in Microscopic Blood Images', 
 'Segmentation techniques for malaria parasite detection.', 
 'Dr. B. Eswara Reddy', '/uploads/malaria_segmentation.pdf', 'Computer Science'),

('An IoT-Based Framework for Health Monitoring Systems: A Case Study Approach', 
 'Using IoT-based frameworks for real-time health monitoring.', 
 'Dr. B. Eswara Reddy', '/uploads/iot_health_monitoring.pdf', 'Computer Science');
 --  Dr.k.f.bharathi researches info 
 INSERT INTO researches (title, abstract, facultyName, filePath, department) VALUES
('Spam Detection in Social Media Using Agglomerative Clustering', 
 'Using clustering techniques to improve spam detection in social media.', 
 'Dr. K.F. Bharati', '/uploads/spam_detection.pdf', 'Computer Science'),

('Heart Disease Prediction Using KNN', 
 'Applying K-Nearest Neighbors (KNN) for heart disease prediction.', 
 'Dr. K.F. Bharati', '/uploads/heart_disease_knn.pdf', 'Computer Science'),

('Improvising Dynamic Cloud Resource Allocation to Optimize QoS and Cost Effectiveness', 
 'Optimizing cloud resource allocation with dynamic scheduling.', 
 'Dr. K.F. Bharati', '/uploads/cloud_qos_optimization.pdf', 'Computer Science'),

('Cost Effective Heuristic Mechanism for Scheduling Virtual Machines in Dynamic Cloud Environment', 
 'Heuristic approaches for virtual machine scheduling in cloud computing.', 
 'Dr. K.F. Bharati', '/uploads/vm_scheduling.pdf', 'Computer Science'),

('Stress Detection in Social Networks using Word Semantic Similarity Technique', 
 'Analyzing stress levels using semantic similarity in social networks.', 
 'Dr. K.F. Bharati', '/uploads/stress_detection_social_media.pdf', 'Computer Science'),

('Automatic Retrieval of User Interests Based on Tags in Social Media', 
 'Extracting user preferences from tagged social media content.', 
 'Dr. K.F. Bharati', '/uploads/user_interests_social_media.pdf', 'Computer Science'),

('Product Recommendation Using Convolution Neural Network in Social Media', 
 'CNN-based recommendation systems for social media.', 
 'Dr. K.F. Bharati', '/uploads/product_recommendation_cnn.pdf', 'Computer Science'),

('A Survey on Artificial Intelligence and its Applications', 
 'Surveying the latest AI applications across industries.', 
 'Dr. K.F. Bharati', '/uploads/ai_survey.pdf', 'Computer Science'),

('Dimensionality Reduction by Using Sentiment Classification for Deep Learning Approach', 
 'Using sentiment analysis to improve dimensionality reduction in deep learning.', 
 'Dr. K.F. Bharati', '/uploads/dimensionality_reduction_dl.pdf', 'Computer Science'),

('A Fast Collaborative Filtering Approach for Web Personalized Recommendation Systems', 
 'Enhancing collaborative filtering techniques for personalized recommendations.', 
 'Dr. K.F. Bharati', '/uploads/web_recommendation_system.pdf', 'Computer Science');
-- dr.k.f Bharathi publications 
INSERT INTO publications3 (title, abstract, facultyName, filePath, department) VALUES
('Efficiently Mining Multiple High-Quality Phrases from Text Corpus', 
 'Using text mining techniques to extract high-quality phrases.', 
 'Dr. K.F. Bharati', '/uploads/text_mining_phrases.pdf', 'Computer Science'),

('Privacy Preserving Data Publishing Using Three Metrics Techniques', 
 'Ensuring privacy while publishing data using multiple metrics.', 
 'Dr. K.F. Bharati', '/uploads/privacy_data_publishing.pdf', 'Computer Science'),

('A Generalized Approach to Improve the Quality and Cost Effectiveness of Fault Prediction', 
 'Improving software fault prediction models for cost-effectiveness.', 
 'Dr. K.F. Bharati', '/uploads/fault_prediction_model.pdf', 'Computer Science'),

('Security for Health Care Records with Time-Based Automatic Access Revocation', 
 'A time-based security model for managing access to healthcare records.', 
 'Dr. K.F. Bharati', '/uploads/healthcare_security.pdf', 'Computer Science'),

('A Framework for Deep Web Crawler Using Genetic Algorithm', 
 'Applying genetic algorithms for improved web crawling.', 
 'Dr. K.F. Bharati', '/uploads/deep_web_crawler.pdf', 'Computer Science');
-- Dr.k.madhavi researches 
INSERT INTO researches (title, abstract, facultyName, filePath, department) VALUES
('SessionRNNRec: A Deep Learning Based Framework for Modelling User Sessions to Generate Accurate Recommendations', 
 'Deep learning framework for user session modeling and recommendation.', 
 'Dr. K. Madhavi', '/uploads/session_rnnrec.pdf', 'Computer Science'),

('Adaptive Exponential Bat Algorithm and Deep Learning for Big Data Classification', 
 'Using bat algorithm and deep learning for big data.', 
 'Dr. K. Madhavi', '/uploads/bat_algorithm_big_data.pdf', 'Computer Science'),

('Energy and Trust Aware Secure Routing Algorithm for Big Data Classification Using MapReduce Framework in IoT Networks', 
 'Secure routing for big data using IoT and MapReduce.', 
 'Dr. K. Madhavi', '/uploads/secure_routing_iot.pdf', 'Computer Science'),

('Trust and Energy Aware Routing Algorithm for IoT Networks', 
 'Energy efficient routing algorithm for IoT networks.', 
 'Dr. K. Madhavi', '/uploads/iot_routing.pdf', 'Computer Science'),

('Setting up AdHoc Cloud Computing as a Service in Mobile AdHoc Cloud Computing Environment', 
 'AdHoc cloud service setup for mobile environments.', 
 'Dr. K. Madhavi', '/uploads/adhoc_cloud_service.pdf', 'Computer Science'),

('An Empirical Study of the Big Data Classification Methodologies', 
 'An in-depth analysis of big data classification techniques.', 
 'Dr. K. Madhavi', '/uploads/big_data_classification.pdf', 'Computer Science');
-- dr.k.madhavi publications 
INSERT INTO publications3 (title, abstract, facultyName, filePath, department) VALUES
('Cloud Security Solutions through Machine Learning Approaches: A Survey', 
 'Surveying cloud security solutions enabled by machine learning.', 
 'Dr. K. Madhavi', '/uploads/cloud_security_ml.pdf', 'Computer Science'),

('Artificial Neural Networks Based Nutrition Monitoring System Using Internet of Things', 
 'Using IoT and neural networks for nutrition monitoring.', 
 'Dr. K. Madhavi', '/uploads/nutrition_monitoring_iot.pdf', 'Computer Science'),

('Controlling Hypervisor for Live-Migration in Bare-Metal Clouds', 
 'Improving cloud live migration through hypervisor control.', 
 'Dr. K. Madhavi', '/uploads/hypervisor_cloud_migration.pdf', 'Computer Science'),

('A Multilevel Principal Component Analysis Based QoS Aware Service Discovery and Ranking Framework in Multi-Cloud Environment', 
 'Optimizing service discovery in multi-cloud through PCA.', 
 'Dr. K. Madhavi', '/uploads/multi_cloud_qos.pdf', 'Computer Science'),

('EGCOPRAS: QoS-Aware Hybrid MCDM Model for Cloud Service Selection in Multi-Cloud Environment', 
 'Hybrid MCDM model for cloud service selection.', 
 'Dr. K. Madhavi', '/uploads/cloud_service_selection.pdf', 'Computer Science');





# Jenkins Installation

Step 1: Install Java

```bash
sudo dnf -y install java-1.8.0-openjdk-devel
```

Step 2: Add Jenkins Software Repository

```bash
sudo wget –O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
```

```bash
sudo nano /etc/yum.repos.d/jenkins.repo
```

```bash
[jenkins]

name=Jenkins-stable

baseurl=http://pkg.jenkins.io/redhat

gpgcheck=1
```

Next, import the GPG key to ensure your software is legitimate:

```bash
sudo rpm ––import https://pkg.jenkins.io/redhat/jenkins.io.key
```

Step 3: Install Jenkins on CentOS 8

```bash
sudo dnf -y install jenkins
```

```bash
systemctl enable --now jenkins
```

```bash
systemctl status jenkins
```

Step 4: Set Firewall to Allow Jenkin

```bash
sudo firewall-cmd ––permanent ––zone=public ––add-port=8080/tcp
sudo firewall-cmd ––permanent ––zone=public ––add-port=6443/tcp
```

```bash
sudo firewall-cmd ––reload
```

Step 5: Run and Set up Jenkins on CentOS 8

```bash
http://localhost:8080
```
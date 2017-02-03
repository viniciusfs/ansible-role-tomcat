import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    '.molecule/ansible_inventory').get_hosts('all')


def test_tomcat_group(Group):
    tomcat = Group('tomcat')

    assert tomcat.exists
    assert tomcat.gid == 215


def test_tomcat_user(User):
    tomcat = User('tomcat')

    assert tomcat.exists
    assert tomcat.uid == 215
    assert tomcat.group == 'tomcat'
    assert tomcat.home == '/opt/tomcat'


def test_tomcat_directory(File):
    tomcat_directory = File('/opt/apache-tomcat-7.0.75')

    assert tomcat_directory.exists
    assert tomcat_directory.is_directory


def test_tomcat_home(File):
    tomcat_home = File('/opt/tomcat')

    assert tomcat_home.exists
    assert tomcat_home.is_symlink
    assert tomcat_home.linked_to == '/opt/apache-tomcat-7.0.75'


def test_tomcat_started_enabled(Service):
    tomcat = Service('tomcat')

    assert tomcat.is_running
    assert tomcat.is_enabled


def test_tomcat_port(Socket):
    assert Socket("tcp://0.0.0.0:8080").is_listening

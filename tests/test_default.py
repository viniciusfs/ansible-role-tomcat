import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    '.molecule/ansible_inventory').get_hosts('all')


def test_tomcat_group(Group):
    tomcat_group = Group('tomcat')

    assert tomcat_group.exists


def test_tomcat_user(User):
    tomcat_user = User('tomcat')

    assert tomcat_user.exists
    assert tomcat_user.group == 'tomcat'


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

    assert tomcat.is_started
    assert tomcat.is_enabled

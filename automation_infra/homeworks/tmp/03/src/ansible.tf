resource "local_file" "ansible_hosts" {
  content = templatefile("${path.module}/hosts.tftpl",
    {
      webservers = flatten(tolist( [yandex_compute_instance.count, [for fe in yandex_compute_instance.for_each: fe]] ))
    }
  )
  filename = "${abspath(path.module)}/hosts.cfg"
}

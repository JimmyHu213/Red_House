import 'package:flutter/material.dart';

class ServiceView extends StatelessWidget {
  const ServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return ServiceCard(service: services[index]);
      },
    );
  }
}

class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(service.icon, size: 48, color: Colors.blue),
          const SizedBox(height: 8),
          Text(
            service.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class Service {
  final String name;
  final IconData icon;

  Service({required this.name, required this.icon});
}

final List<Service> services = [
  Service(name: 'Web Development', icon: Icons.web),
  Service(name: 'Mobile App Development', icon: Icons.mobile_friendly),
  Service(name: 'UI/UX Design', icon: Icons.design_services),
  Service(name: 'Cloud Services', icon: Icons.cloud),
  Service(name: 'Data Analytics', icon: Icons.analytics),
  Service(name: 'Cybersecurity', icon: Icons.security),
  Service(name: 'AI & Machine Learning', icon: Icons.smart_toy),
  Service(name: 'IoT Solutions', icon: Icons.devices),
  Service(name: 'Blockchain', icon: Icons.link),
];

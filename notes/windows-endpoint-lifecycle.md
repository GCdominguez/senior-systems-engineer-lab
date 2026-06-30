# Windows Endpoint Lifecycle

## 1. Device Procurement

A corporate Windows device is purchased through an approved vendor or reseller.

## 2. Autopilot Registration

The device hardware hash is registered with Windows Autopilot and assigned to a deployment profile.

## 3. First Boot / OOBE

The user powers on the device, connects to the internet, and begins the out-of-box experience.

## 4. Entra ID Join

The device joins Entra ID during provisioning.

## 5. Intune Enrollment

The device enrolls into Intune and becomes manageable.

## 6. Configuration Profiles

Security, network, browser, update, and system policies apply.

## 7. Compliance Evaluation

The device is evaluated against compliance policies such as encryption, OS version, password requirements, and threat state.

## 8. Application Deployment

Required applications are installed using Win32 app packages, Microsoft Store apps, or scripts.

## 9. Monitoring and Remediation

Endpoint health is monitored. Scripts or remediation policies correct drift where possible.

## 10. Retirement / Wipe

The device is retired, wiped, or re-provisioned at the end of its lifecycle.

package com.gpsalarm.model

import jakarta.persistence.*
import java.time.LocalDateTime

@Entity
@Table(name = "user_locations")
data class UserLocation(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long? = null,

    @Column(nullable = false)
    val deviceId: String, // FCM 토큰으로 사용

    @Column(nullable = false)
    val latitude: Double,

    @Column(nullable = false)
    val longitude: Double,

    @Column(nullable = false)
    val lastUpdated: LocalDateTime = LocalDateTime.now()
) 
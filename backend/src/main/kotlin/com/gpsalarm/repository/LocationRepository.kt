package com.gpsalarm.repository

import com.gpsalarm.model.Location
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface LocationRepository : JpaRepository<Location, Long> {
    fun findByIsActiveTrue(): List<Location>
} 
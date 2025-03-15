package com.gpsalarm.service

import com.gpsalarm.model.Location
import com.gpsalarm.repository.LocationRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class LocationService(
    private val locationRepository: LocationRepository
) {
    fun getAllLocations(): List<Location> = locationRepository.findAll()

    fun getActiveLocations(): List<Location> = locationRepository.findByIsActiveTrue()

    fun getLocation(id: Long): Location = locationRepository.findById(id)
        .orElseThrow { NoSuchElementException("Location not found with id: $id") }

    @Transactional
    fun createLocation(location: Location): Location = locationRepository.save(location)

    @Transactional
    fun updateLocation(id: Long, location: Location): Location {
        getLocation(id) // 존재 여부 확인
        return locationRepository.save(location.copy(id = id))
    }

    @Transactional
    fun deleteLocation(id: Long) {
        val location = getLocation(id)
        locationRepository.save(location.copy(isActive = false))
    }
} 
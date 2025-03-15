package com.gpsalarm.controller

import com.gpsalarm.model.Location
import com.gpsalarm.service.LocationService
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/locations")
class LocationController(
    private val locationService: LocationService
) {
    @GetMapping
    fun getAllLocations(): List<Location> = locationService.getAllLocations()

    @GetMapping("/active")
    fun getActiveLocations(): List<Location> = locationService.getActiveLocations()

    @GetMapping("/{id}")
    fun getLocation(@PathVariable id: Long): Location = locationService.getLocation(id)

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    fun createLocation(@RequestBody location: Location): Location = locationService.createLocation(location)

    @PutMapping("/{id}")
    fun updateLocation(@PathVariable id: Long, @RequestBody location: Location): Location =
        locationService.updateLocation(id, location)

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteLocation(@PathVariable id: Long) = locationService.deleteLocation(id)
} 
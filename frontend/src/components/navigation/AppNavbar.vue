<template>
  <BNavbar class="navbar-dark bg-dark" expand="lg">
    <BContainer fluid class="d-flex align-items-center">

      <!-- Brand -->
      <BNavbarBrand
        class="me-3"
        style="color: #8e44ad; font-weight: bold; font-size: 1.2rem;"
      >
        reActive
      </BNavbarBrand>

      <!-- Navbar toggler for mobile -->
      <BNavbarToggle target="nav-collapse" />

      <!-- Nav items immediately to the right of brand -->
      <BCollapse id="nav-collapse" is-nav>
        <BNavbarNav class="align-items-center">
          <BNavItem to="/dashboard" tag="router-link">Dashboard</BNavItem>
          <BNavItem to="/" tag="router-link">Calendar</BNavItem>
          <BNavItem to="/map" tag="router-link">Map</BNavItem>
          <BNavItem to="/season" tag="router-link">Season</BNavItem>
          <BNavItem to="/analysis" tag="router-link">Analysis</BNavItem>
          <BNavItem to="/upload" tag="router-link">Upload</BNavItem>
        </BNavbarNav>
      </BCollapse>

    </BContainer>
  </BNavbar>
</template>
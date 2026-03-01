<template>
  <BNavbar toggleable="lg" type="dark" variant="dark">
    <BContainer fluid>
      <BNavbarBrand>My Framework</BNavbarBrand>

      <BNavbarToggle target="nav-collapse" />

      <BCollapse id="nav-collapse" is-nav>
        <BNavbarNav>
          <BNavItem to="/" tag="router-link">Calendar</BNavItem>
          <BNavItem to="/map" tag="router-link">Map</BNavItem>
          <BNavItem to="/columns" tag="router-link">Columns</BNavItem>
        </BNavbarNav>
      </BCollapse>
    </BContainer>
  </BNavbar>
</template>
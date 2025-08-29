# Overview

This is a WhatsApp-inspired real-time chat application built with a modern full-stack architecture. The application provides instant messaging capabilities with features like user authentication, direct messaging, group chats, real-time message delivery, and online status tracking. The interface is designed with Arabic language support and follows WhatsApp's familiar design patterns.

# User Preferences

Preferred communication style: Simple, everyday language.

# System Architecture

## Frontend Architecture
The client is built using React with TypeScript and follows a component-based architecture. The UI leverages shadcn/ui components with Radix UI primitives for accessibility and consistency. The design system uses Tailwind CSS with custom CSS variables for theming, including WhatsApp-specific color schemes. State management is handled through React Query for server state and React's built-in state for local UI state.

The routing is implemented using Wouter for client-side navigation. The application structure separates concerns with dedicated directories for components, pages, hooks, and utilities. Path aliases are configured for clean imports, with `@/` pointing to the client source directory.

## Backend Architecture
The server uses Express.js with TypeScript in an ESM configuration. The architecture follows RESTful API principles with WebSocket support for real-time messaging. Routes are organized by feature areas (auth, chats, messages) with middleware for authentication and error handling.

The database layer uses Drizzle ORM with PostgreSQL, providing type-safe database operations. The storage layer implements a service pattern with interfaces for testability and maintainability. Session management is handled through PostgreSQL-backed sessions for persistence across server restarts.

## Authentication System
Authentication is implemented using Replit Auth with OpenID Connect. The system uses Passport.js for authentication strategy handling and maintains user sessions in the database. Protected routes require authentication middleware, and the client handles authentication state through React Query with automatic redirects for unauthorized access.

## Real-time Communication
WebSocket connections are established for real-time messaging features including message delivery, typing indicators, and online status updates. The client maintains WebSocket connections per chat and handles reconnection logic for reliability.

## Database Design
The PostgreSQL schema includes tables for users, chats, messages, chat members, and sessions. The design supports both direct messages and group chats through a flexible chat membership system. Message threading and read status tracking are built into the schema design.

# External Dependencies

## Core Dependencies
- **React 18** - Frontend framework with TypeScript support
- **Express.js** - Backend web server framework
- **Drizzle ORM** - Type-safe PostgreSQL database toolkit
- **PostgreSQL** - Primary database using Neon serverless
- **Tailwind CSS** - Utility-first CSS framework for styling

## UI Components
- **Radix UI** - Comprehensive set of accessible React primitives
- **shadcn/ui** - Pre-built component library using Radix UI
- **Lucide React** - Icon library for consistent iconography

## Authentication & Sessions
- **Replit Auth** - OAuth provider integration via OpenID Connect
- **Passport.js** - Authentication middleware for Express
- **connect-pg-simple** - PostgreSQL session store for Express sessions

## Real-time Features
- **WebSocket (ws)** - Native WebSocket implementation for real-time communication
- **@neondatabase/serverless** - Serverless PostgreSQL driver for database connections

## Development Tools
- **Vite** - Frontend build tool and development server
- **TypeScript** - Type safety across the entire stack
- **ESBuild** - JavaScript bundler for production builds
- **Drizzle Kit** - Database schema management and migrations
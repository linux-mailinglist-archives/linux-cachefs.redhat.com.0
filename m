Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5908709E5B
	for <lists+linux-cachefs@lfdr.de>; Fri, 19 May 2023 19:40:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684518006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GeC4C9fm5zPL3zm/pVeLOmjiumC4xij8yXs4EcwdbRM=;
	b=CpR8VPlH6lpVJ5mgYlLgvWI7GrOF+IcdFRK8w0FrumMCKfiJbDEoKgZsvx52t8P1Q8sLu4
	pykFJLSEdv6vLRoXr54+H3r886iTd1sfdZqDku36X8Ler3Yt81fDpelyKklGHUZEYiYEKH
	UZK563lZ6hzX797TlF3uxzikkC9262A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-jYzkpwjZOlmTToJm5Re1Vg-1; Fri, 19 May 2023 13:40:03 -0400
X-MC-Unique: jYzkpwjZOlmTToJm5Re1Vg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14E22800C81;
	Fri, 19 May 2023 17:40:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0A7D940D1B60;
	Fri, 19 May 2023 17:40:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C21FA19465B7;
	Fri, 19 May 2023 17:40:02 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2DEE019465A4 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 19 May 2023 17:40:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0FD222166B33; Fri, 19 May 2023 17:40:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70C792166B25;
 Fri, 19 May 2023 17:40:00 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
MIME-Version: 1.0
Date: Fri, 19 May 2023 18:39:59 +0100
Message-ID: <1853961.1684517999@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH] cachefilesd: Allow the daemon to run as a
 non-root user
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-erofs@lists.ozlabs.org, Jeff Layton <jlayton@kernel.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1853960.1684517999.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

    
Allow the daemon to run as a non-root user after opening the control device
- which will also make the kernel driver run as the same non-root user
since it borrows the daemons credentials.

This requires a fix to the cachefiles kernel driver to make it set the mode
on files in creates to 0600.

This also requires the SELinux policy to be changed so that cachefilesd can
access /etc/passwd, otherwise only numeric uids and gids can be set.

Signed-off-by: David Howells <dhowells@redhat.com>
---
 cachefilesd.c      |   59 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 cachefilesd.conf.5 |    7 ++++++
 2 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/cachefilesd.c b/cachefilesd.c
index 6c435f6..81bb87d 100644
--- a/cachefilesd.c
+++ b/cachefilesd.c
@@ -48,6 +48,7 @@
 #include <poll.h>
 #include <limits.h>
 #include <grp.h>
+#include <pwd.h>
 #include <sys/inotify.h>
 #include <sys/time.h>
 #include <sys/vfs.h>
@@ -121,6 +122,8 @@ static unsigned long long brun, bcull, bstop, frun, fcull, fstop;
 static unsigned long long b_resume_threshold = ULLONG_MAX;
 static unsigned long long f_resume_threshold = 5;
 
+static uid_t daemon_uid;
+static gid_t daemon_gid;
 static const gid_t group_list[0];
 
 #define cachefd 3
@@ -489,6 +492,47 @@ int main(int argc, char *argv[])
 			continue;
 		}
 
+		/* Note UID to run as. */
+		if (memcmp(cp, "uid", 3) == 0 && isspace(cp[3])) {
+			struct passwd *pwd;
+			char *end;
+
+			for (cp += 3; isspace(*cp); cp++) {;}
+			if (!*cp)
+				cfgerror("Error parsing username/uid");
+
+			daemon_uid = strtoul(cp, &end, 10);
+			if (*end) {
+				pwd = getpwnam(cp);
+				if (!pwd)
+					oserror("Couldn't look up username/uid '%s'", cp);
+				daemon_uid = pwd->pw_uid;
+				daemon_gid = pwd->pw_gid;
+			} else {
+				daemon_gid = -1;
+			}
+			continue;
+		}
+
+		/* Note GID to run as. */
+		if (memcmp(cp, "gid", 3) == 0 && isspace(cp[3])) {
+			struct group *grp;
+			char *end;
+
+			for (cp += 3; isspace(*cp); cp++) {;}
+			if (!*cp)
+				cfgerror("Error parsing group name/gid");
+
+			daemon_gid = strtoul(cp, &end, 10);
+			if (*end) {
+				grp = getgrnam(cp);
+				if (!grp)
+					oserror("Couldn't look up group name/gid '%s'", cp);
+				daemon_gid = grp->gr_gid;
+			}
+			continue;
+		}
+
 		/* note the dir command */
 		if (memcmp(cp, "dir", 3) == 0 && isspace(cp[3])) {
 			char *sp;
@@ -545,13 +589,24 @@ int main(int argc, char *argv[])
 	if (nullfd != 1)
 		dup2(nullfd, 1);
 
-	for (loop = 4; loop < open_max; loop++)
-		close(loop);
+	if (close_range(4, open_max, 0) == -1) {
+		for (loop = 4; loop < open_max; loop++)
+			close(loop);
+	}
 
 	/* set up a connection to syslog whilst we still can (the bind command
 	 * will give us our own namespace with no /dev/log */
 	openlog("cachefilesd", LOG_PID, LOG_DAEMON);
 	xopenedlog = true;
+
+	if (daemon_uid || daemon_gid) {
+		info("Setting credentials");
+		if (setresgid(daemon_gid, daemon_gid, daemon_gid) < 0)
+			oserror("Unable to set GID to %d", daemon_gid);
+		if (setresuid(daemon_uid, daemon_uid, daemon_uid) < 0)
+			oserror("Unable to set UID to %d", daemon_uid);
+	}
+
 	info("About to bind cache");
 
 	/* now issue the bind command */
diff --git a/cachefilesd.conf.5 b/cachefilesd.conf.5
index b108bdc..534b8f0 100644
--- a/cachefilesd.conf.5
+++ b/cachefilesd.conf.5
@@ -35,6 +35,13 @@ access the cache.  The default is to use cachefilesd's security context.  Files
 will be created in the cache with the label of directory specified to the 'dir'
 command.
 .TP
+.B uid <id>
+.TP
+.B gid <id>
+Set the UID or GID that the daemon runs as to the specified ID.  The ID can be
+given as a number or as a name.  The base cache directory and all the
+directories and files under it must be owned by these IDs.
+.TP
 .B brun <N>%
 .TP
 .B bcull <N>%
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


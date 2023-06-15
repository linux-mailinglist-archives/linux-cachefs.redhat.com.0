Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCCF732CB5
	for <lists+linux-cachefs@lfdr.de>; Fri, 16 Jun 2023 12:03:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686909806;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/ZAKm3FRTJSpnFdvYyGNGPjN0uPJc7ebSS0Dp3NHpdU=;
	b=M3+ZXJD9G9R+zJsMO4z9Rtvx3LLJiSk+bAYbKnqa6IYQmt0F1Pfluzh7jsAPcpSCl0L5qc
	9wkZamfHIIw4NpOhZfSyR8gXHD5xb9SNpyi+Q61mTpEHjjlnookKkbZ87zRhOlS5z+6lVn
	0CkZOX/QZOL3CbIUd19rkgRHOix2DBg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-BbESmB-4OzeYdeN39bb0zw-1; Fri, 16 Jun 2023 06:03:22 -0400
X-MC-Unique: BbESmB-4OzeYdeN39bb0zw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1133858EED;
	Fri, 16 Jun 2023 10:03:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C231141510A;
	Fri, 16 Jun 2023 10:03:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5FDA619465B8;
	Fri, 16 Jun 2023 10:03:13 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B31221946589 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 15 Jun 2023 16:17:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9FEBC492C38; Thu, 15 Jun 2023 16:17:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98B25492C1B
 for <linux-cachefs@redhat.com>; Thu, 15 Jun 2023 16:17:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 631ED1C00420
 for <linux-cachefs@redhat.com>; Thu, 15 Jun 2023 16:17:10 +0000 (UTC)
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17]) by
 relay.mimecast.com with ESMTP id us-mta-651-stIv3mpXOxW4RnvCbYzE0Q-1; Thu,
 15 Jun 2023 12:17:05 -0400
X-MC-Unique: stIv3mpXOxW4RnvCbYzE0Q-1
Received: from fedora.. (p5b3d25f5.dip0.t-ipconnect.de [91.61.37.245])
 by mail.holtmann.org (Postfix) with ESMTPSA id 4A1AACECD7;
 Thu, 15 Jun 2023 18:08:10 +0200 (CEST)
From: Marcel Holtmann <marcel@holtmann.org>
To: linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org
Date: Thu, 15 Jun 2023 18:08:06 +0200
Message-Id: <20230615160806.94000-1-marcel@holtmann.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Fri, 16 Jun 2023 10:03:12 +0000
Subject: [Linux-cachefs] [PATCH] cachefiles: allocate static minor for
 /dev/cachefiles
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
Cc: gregkh@linuxfoundation.org, arnd@arndb.de
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: holtmann.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The cachefiles misc character device uses MISC_DYNAMIC_MINOR and thus
doesn't support module auto-loading. Assign a static minor number for it
and provide appropriate module aliases for it. This is enough for kmod to
create the /dev/cachefiles device node on startup and facility module
auto-loading.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 Documentation/admin-guide/devices.txt | 3 ++-
 fs/cachefiles/main.c                  | 4 +++-
 include/linux/miscdevice.h            | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
index 06c525e01ea5..21b2dda10006 100644
--- a/Documentation/admin-guide/devices.txt
+++ b/Documentation/admin-guide/devices.txt
@@ -376,8 +376,9 @@
 		240 = /dev/userio	Serio driver testing device
 		241 = /dev/vhost-vsock	Host kernel driver for virtio vsock
 		242 = /dev/rfkill	Turning off radio transmissions (rfkill)
+		243 = /dev/cachefiles	Filesystem caching on files
 
-		243-254			Reserved for local use
+		244-254			Reserved for local use
 		255			Reserved for MISC_DYNAMIC_MINOR
 
   11 char	Raw keyboard device	(Linux/SPARC only)
diff --git a/fs/cachefiles/main.c b/fs/cachefiles/main.c
index 3f369c6f816d..eead7b5016a7 100644
--- a/fs/cachefiles/main.c
+++ b/fs/cachefiles/main.c
@@ -30,11 +30,13 @@ MODULE_PARM_DESC(cachefiles_debug, "CacheFiles debugging mask");
 MODULE_DESCRIPTION("Mounted-filesystem based cache");
 MODULE_AUTHOR("Red Hat, Inc.");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("devname:cachefiles");
+MODULE_ALIAS_MISCDEV(CACHEFILES_MINOR);
 
 struct kmem_cache *cachefiles_object_jar;
 
 static struct miscdevice cachefiles_dev = {
-	.minor	= MISC_DYNAMIC_MINOR,
+	.minor	= CACHEFILES_MINOR,
 	.name	= "cachefiles",
 	.fops	= &cachefiles_daemon_fops,
 };
diff --git a/include/linux/miscdevice.h b/include/linux/miscdevice.h
index c0fea6ca5076..d7f989f593b0 100644
--- a/include/linux/miscdevice.h
+++ b/include/linux/miscdevice.h
@@ -71,6 +71,7 @@
 #define USERIO_MINOR		240
 #define VHOST_VSOCK_MINOR	241
 #define RFKILL_MINOR		242
+#define CACHEFILES_MINOR	243
 #define MISC_DYNAMIC_MINOR	255
 
 struct device;
-- 
2.40.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


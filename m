Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AD67A30EF28
	for <lists+linux-cachefs@lfdr.de>; Thu,  4 Feb 2021 10:02:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-7C6DuNPhMmKJc9IYrcQGUg-1; Thu, 04 Feb 2021 04:02:54 -0500
X-MC-Unique: 7C6DuNPhMmKJc9IYrcQGUg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7713C192AB7A;
	Thu,  4 Feb 2021 09:02:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5940360C13;
	Thu,  4 Feb 2021 09:02:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 292BD18095CB;
	Thu,  4 Feb 2021 09:02:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1147ugD1007199 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 4 Feb 2021 02:56:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E0B7D2026D49; Thu,  4 Feb 2021 07:56:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB6522026D48
	for <linux-cachefs@redhat.com>; Thu,  4 Feb 2021 07:56:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBC0E101A53A
	for <linux-cachefs@redhat.com>; Thu,  4 Feb 2021 07:56:39 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-258-F9gbfEYFMzmL4DqxEyO_xQ-1; Thu, 04 Feb 2021 02:56:37 -0500
X-MC-Unique: F9gbfEYFMzmL4DqxEyO_xQ-1
Received: by mail-wm1-f43.google.com with SMTP id e15so2150011wme.0;
	Wed, 03 Feb 2021 23:56:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=b+smnUyuE7wK61OgxqWN7JVnQDJSBJSmIoedEWNjQv4=;
	b=crM1gnwjXdnf2jN4SR76iwT6q4a+NyVh+eyUo+r3hVOP0n+7Y1FSsXH9zchMvOrck5
	OnMVB8XpDyW4sgdECWEzuLBOVhdJLl5oQV4gOwtKMfLC/SBuQTkXwFvi2NjkqQkjK99i
	Jk5EKR6CHtUXokf0EjKQaerCUdjX2s4w9C80g0Ht9k0krQil2pkTefmYtPyLJwgt89Kh
	t1kJS6jF3k6x15Yni8qLSYuce98NDzo5az8kX3eNYbxuVWMViZAaLyPyQgOYwjbQWUm1
	HC3vjPlme7ECI7syqeb40xyOo1+Y5JtU5DU0vPHfWTX9/vcb1y4Vv86NFFSCMy7AoL5L
	RK3g==
X-Gm-Message-State: AOAM531hjuIIwTPua/j0eEfDQjyBdPp0+PSHJmHB/VMrStnYlNhMBY+u
	E0eD872S8Fs8CS7ycoHLlKq+sVonclg/eg==
X-Google-Smtp-Source: ABdhPJznv8dlGhVT1RXWZc2O8Gbutrctv0DjJ0d2As5aR/nFBLQC467b/jdjfyj7wKr51SBKpu1FgA==
X-Received: by 2002:a1c:7704:: with SMTP id t4mr6089144wmi.55.1612425395879;
	Wed, 03 Feb 2021 23:56:35 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2de7:9900:a89a:b345:dd05:c439])
	by smtp.gmail.com with ESMTPSA id v1sm5307806wmj.31.2021.02.03.23.56.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 03 Feb 2021 23:56:35 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org
Date: Thu,  4 Feb 2021 08:56:24 +0100
Message-Id: <20210204075624.27915-1-lukas.bulwahn@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 04 Feb 2021 04:01:22 -0500
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: [Linux-cachefs] [PATCH] fscache: rectify minor kernel-doc issues
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The command './scripts/kernel-doc -none include/linux/fscache.h' reports
some minor mismatches of the kernel-doc and function signature, which are
easily resolved.

Rectify the kernel-doc, such that no issues remain for fscache.h.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20210202

David, please pick the quick kernel-doc fix.

 include/linux/fscache.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 3f177faa0ac2..7e1f12e52baf 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -418,7 +418,7 @@ int fscache_pin_cookie(struct fscache_cookie *cookie)
 }
 
 /**
- * fscache_pin_cookie - Unpin a data-storage cache object in its cache
+ * fscache_unpin_cookie - Unpin a data-storage cache object in its cache
  * @cookie: The cookie representing the cache object
  *
  * Permit data-storage cache objects to be unpinned from the cache.
@@ -490,7 +490,7 @@ void fscache_wait_on_invalidate(struct fscache_cookie *cookie)
 /**
  * fscache_reserve_space - Reserve data space for a cached object
  * @cookie: The cookie representing the cache object
- * @i_size: The amount of space to be reserved
+ * @size: The amount of space to be reserved
  *
  * Reserve an amount of space in the cache for the cache object attached to a
  * cookie so that a write to that object within the space can always be
-- 
2.17.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


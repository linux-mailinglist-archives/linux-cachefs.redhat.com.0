Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 198353F97C3
	for <lists+linux-cachefs@lfdr.de>; Fri, 27 Aug 2021 12:03:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-KW3ssDbPPX2KX9L3ESlkSA-1; Fri, 27 Aug 2021 06:02:33 -0400
X-MC-Unique: KW3ssDbPPX2KX9L3ESlkSA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4532185302E;
	Fri, 27 Aug 2021 10:02:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C165B27C46;
	Fri, 27 Aug 2021 10:02:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33B014BB7C;
	Fri, 27 Aug 2021 10:02:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17O3J03Z012047 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 23 Aug 2021 23:19:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C0ACA2031A22; Tue, 24 Aug 2021 03:19:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC6442031A38
	for <linux-cachefs@redhat.com>; Tue, 24 Aug 2021 03:18:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38822101A529
	for <linux-cachefs@redhat.com>; Tue, 24 Aug 2021 03:18:57 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-524-8cpBPv-3O4G2LdwEZn2q5g-1; Mon, 23 Aug 2021 23:18:52 -0400
X-MC-Unique: 8cpBPv-3O4G2LdwEZn2q5g-1
Received: by mail-pg1-f169.google.com with SMTP id 17so18487460pgp.4;
	Mon, 23 Aug 2021 20:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=ljIRRfacT3qujdXpWiWXLGhvxuZKggz1kLiwmatqcXk=;
	b=FmVmYydlBY9j0hWNuzmTQddyAXZ2JW/GEpUCnPD/oqPeRUzXnTN/CwfKCLzUT3TuwA
	SqqN6ILwLK0RVLNOCPAyoxyAu62mDaIvOkgoUBWv8u0E80/da0Zrhy/2WH+i2UkncKk9
	Lk5Q0lsxhNmMIAoYiKdPLLjaH/EPXa8xKDBDayB4OaJO5yF/QxWr3saElxogTVDx2VB6
	D6LjV1DXrhwPes8BixaikmLFWO6oJffNiFOYQFwiBfDarX4s1KqHOQsCZTH4+8OG0ICp
	qi0Dgz0OFIl3Lrg5TUZW/uLo1DpIcDsvxDCTRfQ4JgKVzDvnsAmpGLh9gbzFRthk5pYC
	LOzg==
X-Gm-Message-State: AOAM530k09LXrgJgkGKxhJu7RdZsTY3Pxi3jSzgCqkVFAszpJxehrJsu
	YG4ENXgWq3ePgp2UzLVUnoawXA2AZMNf05WU
X-Google-Smtp-Source: ABdhPJxNaVYoMT/jCr83lr4UZlxXdEa+xywTGpfGsALNu6xzjiZ5Sk5tOpjQld6h06NeMok2r6InNQ==
X-Received: by 2002:a63:6705:: with SMTP id b5mr35203852pgc.69.1629775131574; 
	Mon, 23 Aug 2021 20:18:51 -0700 (PDT)
Received: from raspberrypi ([210.183.35.240]) by smtp.gmail.com with ESMTPSA id
	i8sm17691949pfo.117.2021.08.23.20.18.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Aug 2021 20:18:51 -0700 (PDT)
Date: Tue, 24 Aug 2021 04:18:47 +0100
From: Austin Kim <austindh.kim@gmail.com>
To: dhowells@redhat.com
Message-ID: <20210824031847.GA23326@raspberrypi>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-Mailman-Approved-At: Fri, 27 Aug 2021 06:02:28 -0400
Cc: linux-cachefs@redhat.com, linux-kernel@vger.kernel.org, austin.kim@lge.com
Subject: [Linux-cachefs] [PATCH] cachefiles: remove always false 'datalen <
	0' expression
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Austin Kim <austin.kim@lge.com>

Since 'datalen' is declared as size_t, the 'datalen < 0' expression
is always false. Where size_t is defined as below;

   typedef unsigned long __kernel_ulong_t;
   typedef __kernel_ulong_t __kernel_size_t;
   typedef __kernel_size_t size_t;

So it had better remove unnecessary 'always false' expression.

Signed-off-by: Austin Kim <austin.kim@lge.com>
---
 fs/cachefiles/daemon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 752c1e43416f..1cfed9e0812a 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -225,7 +225,7 @@ static ssize_t cachefiles_daemon_write(struct file *file,
 	if (test_bit(CACHEFILES_DEAD, &cache->flags))
 		return -EIO;
 
-	if (datalen < 0 || datalen > PAGE_SIZE - 1)
+	if (datalen > PAGE_SIZE - 1)
 		return -EOPNOTSUPP;
 
 	/* drag the command string into the kernel so we can parse it */
-- 
2.20.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


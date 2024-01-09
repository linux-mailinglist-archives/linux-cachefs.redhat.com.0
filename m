Return-Path: <linux-cachefs+bncBDLIXLMFVAERBHWY6SWAMGQEPGJ6YGI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D9B8284B3
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Jan 2024 12:21:04 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6805a03aeaesf53377606d6.0
        for <lists+linux-cachefs@lfdr.de>; Tue, 09 Jan 2024 03:21:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704799263; cv=pass;
        d=google.com; s=arc-20160816;
        b=rYLEAd8sEYdg2Fc9zn/QHaLQ0JSlIp+yLvHa5o7aeBHlmj8ANyBRPOhd4abfEAve1z
         UwcIsRtafAdn52fVJf4lgzyCfnl7vs//k0sOpTdXew4Ls4YuXh3TzmTEXPFbxgqDyBe5
         V8UsovJbH3FYpZALfSVORyvZbTHliiN7HKEJecc/tLcP03NVLpwRAh64luXtxGyLQjUa
         PrCBfNJXPBJfTk+wnBw86oHQuJ0arQbrFZ/S5dAKZ+GBQwlg+dVVRLAIEkOVhkqurDWz
         4fZ+yfHZu01MuvVfkAACQcAOSvPfTOwca1WcbDgYONneo0FSgDUvylOIZupvPWgCjac/
         TNcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=UkCHt/s7FLCz0IeTHaKATQCcitA8CypnpDqFz184klM=;
        fh=rqpPS96O0g2fQmn7KhcIs+VloH2LssYDKKWvCBPtAeo=;
        b=G/e6wTcYIWWdfNbkKhcUs1dZuxKDHrThVECXsMMaqRfeGCgOkriAbG6kiyUv8ZaTbY
         b/uE0FtPDckFakuizHIZ6kyMTbrM7MC5Q45j0AbKcPO6/CMzE/OIBju3T0eqHwOxangv
         f8kze97t3CKbo3KzkYK10395p31oirDVfoSe6eJ/lSg+J0rTkLy6cHF4xjay0OIR3xH1
         OgY7C5ONJVm8FYS2JOEuzFNMk1p+MH2NRBdzbB2CvDPzSeGZEC37slhtizCCYatXsFXK
         nUq4narnUujd9ol6x/oJzpr8t1GCZrPFQPzVM0wInKxIYSyZQonzdTNytYiIhWL9UDzQ
         L+wQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704799263; x=1705404063;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkCHt/s7FLCz0IeTHaKATQCcitA8CypnpDqFz184klM=;
        b=GsMD9ioITxvVNlhYm29A3ZF4WZ+cw5/GOeSSWs6dEk55iGiATvK9oxnYyRL398BKGq
         7rU7GfyBV10GL9b1Y+yySiE7gn9gIrIdFNeJAtXQ6RFp2QDhT8PRCQeTYoVtngfLUpd/
         yyBCk0LmMr3OmheJXXTJMiGDhD849cpipSn4sR1XuhVzjCRb0trEIV1/CMuwCi+eCsex
         lnCJHMcPxNIlVClcR3L/MfKjliSyblOOkLW0X0JUqJfS7bsws15eqyHZ+F1cRe/rqMzq
         J0ZGLHEWb+rw1qLVsEdFRZo6fQJQSyv7SgXUlMAqDOWW+lETe2uvwIYq9y+PO6EHVoXz
         OrXw==
X-Gm-Message-State: AOJu0YwcZy0qV+/hStVXBYo0fRGJgfY7sSD7EwcZsvyHzahSyBz+8oLZ
	dXlIaK36ANlznVIhQgsGBNN2gRCLP3Sx0g==
X-Google-Smtp-Source: AGHT+IFgmlHWgi/0X3wp6Cz6aAZqGLs8l55I2wDRjD0FGjxfQ0M4pDYbg1v1JObf9Ul8RlwBQF2KQQ==
X-Received: by 2002:a05:6214:11a5:b0:680:f802:79f3 with SMTP id u5-20020a05621411a500b00680f80279f3mr5250302qvv.40.1704799262863;
        Tue, 09 Jan 2024 03:21:02 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:5008:b0:680:c838:efbe with SMTP id
 jo8-20020a056214500800b00680c838efbels253823qvb.0.-pod-prod-01-us; Tue, 09
 Jan 2024 03:21:02 -0800 (PST)
X-Received: by 2002:ad4:5967:0:b0:67f:9859:3ce2 with SMTP id eq7-20020ad45967000000b0067f98593ce2mr7188212qvb.128.1704799262349;
        Tue, 09 Jan 2024 03:21:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704799262; cv=none;
        d=google.com; s=arc-20160816;
        b=VROP6FlIM4Nw5BqmV47IDq50Bro/gLo32jTiJotZW/OlXWsj7D6lreMmXpnmamA4VG
         Ex5zBVOnDmf6FaFZBothUreHsSX7OrHE6JWNRZ+TY+VPujHH5X8PTr+4wnh/4Q2nRFHy
         StjiqFkJpLuznEu2PhgnYzwKYRYMt2Zczi4VJ2NSvZTqusjEFS6eJoz1EC+73IMpv3lH
         hAnzYYNDNU40lEOzwSqN/eRCL7rmNNeD0SDmgqSGWNZKEkVaoDLdqLA63l3ZxHowaa9z
         1FI6oeYLSnTYGV6sl7pIKATkyB51GGNx/7QN4l2LVGl+v7paOBZoxWRkicHvo7KBxv3p
         TuQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Z0xNWJpdRPanEuZiAQenKRA87zeZrifRwyW7XU8kxYA=;
        fh=rqpPS96O0g2fQmn7KhcIs+VloH2LssYDKKWvCBPtAeo=;
        b=DaAsdEq1vgL+QyeQ3HYUOsKB1WRWqh48Q8EX/oRwPCXY6T59h6MYI541FS0xB+1WZ3
         XHWnEUUUugxjCHwVZiE3gqGc0KTC/gtM7vflyFbRuVq0RFcHLjxi0b9HVd5HBIA+zj5W
         +OGISB6CYOP7XCLf4nicvFQ9OuOjE1wjxNhmrW8Ane6zZ9lwDIQV0SSZQcr30SAeEtyz
         XCu0gnTfwyhzndUuAMFvGwJksDRNJibl4gwpQY+cskb76YLTq9xsnS7qHfpj20+xGU+v
         /zBy61M/ovxYJdpzZIWKJHkpvLZYSi5klCFX0QN4etFm2Wc/zLtNjvhrRhCtXik9v26q
         Wy3g==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id t18-20020a0cb392000000b00681181ca7b8si756011qve.583.2024.01.09.03.21.02
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 03:21:02 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-326-fOtUaDa-PxicHkBCD6ZE2Q-1; Tue,
 09 Jan 2024 06:20:59 -0500
X-MC-Unique: fOtUaDa-PxicHkBCD6ZE2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C36F3C0F222
	for <linux-cachefs@gapps.redhat.com>; Tue,  9 Jan 2024 11:20:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 3902D1121313; Tue,  9 Jan 2024 11:20:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C71151121306;
	Tue,  9 Jan 2024 11:20:53 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Steve French <smfrench@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Yiqun Leng <yqleng@linux.alibaba.com>,
	Jia Zhu <zhujia.zj@bytedance.com>
Subject: [PATCH 5/6] cachefiles: Fix signed/unsigned mixup
Date: Tue,  9 Jan 2024 11:20:22 +0000
Message-ID: <20240109112029.1572463-6-dhowells@redhat.com>
In-Reply-To: <20240109112029.1572463-1-dhowells@redhat.com>
References: <20240109112029.1572463-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

In __cachefiles_prepare_write(), the start and pos variables were made
unsigned 64-bit so that the casts in the checking could be got rid of -
which should be fine since absolute file offsets can't be negative, except
that an error code may be obtained from vfs_llseek(), which *would* be
negative.  This breaks the error check.

Fix this for now by reverting pos and start to be signed and putting back
the casts.  Unfortunately, the error value checks cannot be replaced with
IS_ERR_VALUE() as long might be 32-bits.

Fixes: 7097c96411d2 ("cachefiles: Fix __cachefiles_prepare_write()")
Reported-by: Simon Horman <horms@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401071152.DbKqMQMu-lkp@intel.com/
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Simon Horman <horms@kernel.org>
cc: Gao Xiang <hsiangkao@linux.alibaba.com>
cc: Yiqun Leng <yqleng@linux.alibaba.com>
cc: Jia Zhu <zhujia.zj@bytedance.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-erofs@lists.ozlabs.org
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/cachefiles/io.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 3eec26967437..9a2cb2868e90 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -522,7 +522,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 			       bool no_space_allocated_yet)
 {
 	struct cachefiles_cache *cache = object->volume->cache;
-	unsigned long long start = *_start, pos;
+	loff_t start = *_start, pos;
 	size_t len = *_len;
 	int ret;
 
@@ -556,7 +556,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 					  cachefiles_trace_seek_error);
 		return pos;
 	}
-	if (pos >= start + *_len)
+	if ((u64)pos >= (u64)start + *_len)
 		goto check_space; /* Unallocated region */
 
 	/* We have a block that's at least partially filled - if we're low on
@@ -575,7 +575,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 					  cachefiles_trace_seek_error);
 		return pos;
 	}
-	if (pos >= start + *_len)
+	if ((u64)pos >= (u64)start + *_len)
 		return 0; /* Fully allocated */
 
 	/* Partially allocated, but insufficient space: cull. */

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


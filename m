Return-Path: <linux-cachefs+bncBDLIXLMFVAERB6HTYOYQMGQE7SPYR6Q@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9C48B77F7
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:02:34 +0200 (CEST)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6ee4037d61asf2399045a34.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:02:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714485753; cv=pass;
        d=google.com; s=arc-20160816;
        b=pPIa5v3gYTSH7NiMiEeMV+pnOxT4Qx9kYFmbYCfVuUqhWjl0dxsOdObqWMYQ6CrzpB
         TOh4d/kBiUkmrz7vYjKxVVtcIrdxo8dwMSN2kIzY6nCgCT8c627saagydtNRFfUv3H9Y
         TZy53JvklJOeRjHFifhVFLB1JUqB8S4vdzpT9UAsNmXmk7WgeAkbsCT/SHwcNK1c5SCu
         W/emr5TNpv45KwtNzhr/1uBEmJR069vU4vBjzf1he562MnTWkbexGdjye6HIwPzALwoi
         ID9XMQKLTFXKygdllhLXOeyiL1g3g6dzUR7tNb2fk/hu/AOAMgUkS61LICA5MfDrBfJS
         lbEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=uIRrrn88LRpV+PmZzaiI/cE0lk0dvIGfZ6dShjMiGP8=;
        fh=j8peGtADUYvVIa5rXwGpuZl8R8fFY9fajWH9thJgffA=;
        b=Jyulxa2wHe3KJLZwdJrjl52B6AvWH3ZtJqNzodXshdcjCvd8J1tdspBi485Dk+8cOW
         7yRrmqoEkF8rlHmWPZK4CmGUKW+/1g/lBUKiXERRVw1MqvLS06NXAal3obth61jZUcVf
         r+0J5TJ1j8ooj51dIbvRodRAPWJF2x4GhVORqCIkK7trfI/nQAityq7lgfFHjqNjyAPy
         6OH0C8mJAJIBnPPhoHWa6BMN8tDZz/3VhUA32XyTV83FZC3NCeZFyb4eJXYilbQHE06A
         JwnHBuV7yqeE9Eqzjs7EDUWpX0NG5bjl3bIaIH+Zr+A2zLKA37ER+grPdpuxtw9ZzlLX
         MdBQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485753; x=1715090553;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIRrrn88LRpV+PmZzaiI/cE0lk0dvIGfZ6dShjMiGP8=;
        b=eqU/RulD9uj+FhRwfHuP2x2Zj9DX+7T50vI9znj5SrZoo9rOs3PNQrYOztqReAAIuq
         cN/pTyIfVkqrpR7Gg8axYLXHOIW6cCgMeEC0JgQr5KjiGwB1e5dKejjvN36cYtCWMHr0
         zmG7Zb/74LmEEw2n8Qf8TNdAnvVwfYIl6COHaC/bPMRtv50mj8fiC13cLqmKje/1/ESs
         jsuLnmE4Ffl9oSMTgUMGhDikjcDlk75uaAZTU5yRlvTfYDhKlVq3BieWX3xFh56PqMTY
         b3Y0XmZhCqW0MSPqFnMW8sRP2xTvZH4kvc+dkS77Ed5Pebtp4VA2o5YcFYVQWC/Pvw/1
         nBuw==
X-Forwarded-Encrypted: i=2; AJvYcCWULN4J5NRdP1E/D7V2vBCMADKLY3Z1Mc0teqz3rw3WMAittN3eU2o1GGjLfyVAoEk8YfshptWZU9OxyKgfOXH0F3Tl31YfK426njg=
X-Gm-Message-State: AOJu0YxAzUOnny50ATo8xVRH/KoAf+N0dyna1eSLA/9IEfxYUquObbTJ
	vfCJ+F12a/xft9sO+kvKBrikUie2PkPSXgFfmD0evlzPuVkYGi7O/ofn2wSvsSs=
X-Google-Smtp-Source: AGHT+IFD8FeyilQc99Y3D8rhb2SiBF84ABv84Uttp3yxgJAQR3+1WD0q0yXcyVA1qvMOINq6XcQCCg==
X-Received: by 2002:a05:6870:d8c7:b0:23c:a69b:645b with SMTP id of7-20020a056870d8c700b0023ca69b645bmr6162855oac.14.1714485752622;
        Tue, 30 Apr 2024 07:02:32 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:24a2:b0:23b:8acb:73ea with SMTP id
 586e51a60fabf-23b8acc5983ls1317539fac.0.-pod-prod-01-us; Tue, 30 Apr 2024
 07:02:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXSVPWTx3MQiQbUWud9GhM7t2AW+Nydc1c16VTcZUCd0tAjYmXVWP4nhAQhuYJZdCDBlHY41uSWW4b9HGN/2IAZF3d+W9vM05t6UiyXn0=
X-Received: by 2002:a05:6358:720a:b0:18e:b11b:e770 with SMTP id h10-20020a056358720a00b0018eb11be770mr9226679rwa.0.1714485750497;
        Tue, 30 Apr 2024 07:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485750; cv=none;
        d=google.com; s=arc-20160816;
        b=pnC6SKdOtdvxKn40qIZIM2K/Yb7UNe70jizWhMNoxT8RvXZsPxfNZtEwfiCyH2D/PG
         vrEijibLyKBiPux3k/s92b2HRQWUIIxwK25sgMGPBl4OTOVSGklzC7N26gkTCV0Yd0A+
         2B9zZfuKnAvNlwkpBn+k+sgLzs+pSCb8oHMsU1Dg+Ur63ogRKQUOPYJT90n1H4zFWgEp
         tnQrmGXNZFX0btX3bU+gGCjRcA1p+i5Vo/oJqg38zN5rqXemT8ndwax31Ldz86X3/L6P
         VTlX9rdC77PA4lbjMVi2DUInphkJ3ySLzBVU2lIZcnEwgEQoWBpdd2xKdytmHPUDheCu
         PoTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Odg3aZxytikbkfbMJrl0CzuPexMShHC0Kl20ZMSfA0U=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=jVwv38qEdBL54HFhMcBEAseNEVtqSUxpb/j9bhA9LKMQ2RYMHQ0ANwSOqL6cY+ZFSy
         4YDmwoWyPl6l/WPCqz5aEDy2cdyagF85ahBhNjZizaw5zEKdg24UimedQBul+DT+dZxT
         x49xWlSCFLcIqv1WcAe+xp+Hcn4dknU7uYAXPReuB84Wyi4AxCO0vuJ8ecqs2F6wYncG
         oHYp8J4QCMwW2UCVuRRsEccaIPrbD6NHExdno8bzug3/WXV6CLogKhIRovrpiYprQPTl
         Sblx03Cjywenl6DpE0i8TD0WTwZhUkO/8giwQYOSaV4aoA13c5Oxyo/12GHaHAczGD/O
         cDKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id s16-20020a67ce10000000b0047bb0164a0csi4598471vsl.558.2024.04.30.07.02.30
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:30 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-jzR4-R99M6CLHiST0i3UmQ-1; Tue, 30 Apr 2024 10:02:27 -0400
X-MC-Unique: jzR4-R99M6CLHiST0i3UmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31B4381F8CF
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:02:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 2E55CEC688; Tue, 30 Apr 2024 14:02:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9AF33EC680;
	Tue, 30 Apr 2024 14:02:16 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steve French <smfrench@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/22] netfs, cachefiles: Implement helpers for new write code
Date: Tue, 30 Apr 2024 15:00:49 +0100
Message-ID: <20240430140056.261997-19-dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-1-dhowells@redhat.com>
References: <20240430140056.261997-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
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

Implement the helpers for the new write code in cachefiles.  There's now an
optional ->prepare_write() that allows the filesystem to set the parameters
for the next write, such as maximum size and maximum segment count, and an
->issue_write() that is called to initiate an (asynchronous) write
operation.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: netfs@lists.linux.dev
cc: linux-erofs@lists.ozlabs.org
cc: linux-fsdevel@vger.kernel.org
---

Notes:
    Changes
    =======
    ver #2)
     - Add missing linux/bio.h for BIO_MAX_VECS.

 fs/cachefiles/io.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 5ba5c7814fe4..e667dbcd20e8 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/file.h>
 #include <linux/uio.h>
+#include <linux/bio.h>
 #include <linux/falloc.h>
 #include <linux/sched/mm.h>
 #include <trace/events/fscache.h>
@@ -622,6 +623,77 @@ static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
 	return ret;
 }
 
+static void cachefiles_prepare_write_subreq(struct netfs_io_subrequest *subreq)
+{
+	struct netfs_io_request *wreq = subreq->rreq;
+	struct netfs_cache_resources *cres = &wreq->cache_resources;
+
+	_enter("W=%x[%x] %llx", wreq->debug_id, subreq->debug_index, subreq->start);
+
+	subreq->max_len = ULONG_MAX;
+	subreq->max_nr_segs = BIO_MAX_VECS;
+
+	if (!cachefiles_cres_file(cres)) {
+		if (!fscache_wait_for_operation(cres, FSCACHE_WANT_WRITE))
+			return netfs_prepare_write_failed(subreq);
+		if (!cachefiles_cres_file(cres))
+			return netfs_prepare_write_failed(subreq);
+	}
+}
+
+static void cachefiles_issue_write(struct netfs_io_subrequest *subreq)
+{
+	struct netfs_io_request *wreq = subreq->rreq;
+	struct netfs_cache_resources *cres = &wreq->cache_resources;
+	struct cachefiles_object *object = cachefiles_cres_object(cres);
+	struct cachefiles_cache *cache = object->volume->cache;
+	const struct cred *saved_cred;
+	size_t off, pre, post, len = subreq->len;
+	loff_t start = subreq->start;
+	int ret;
+
+	_enter("W=%x[%x] %llx-%llx",
+	       wreq->debug_id, subreq->debug_index, start, start + len - 1);
+
+	/* We need to start on the cache granularity boundary */
+	off = start & (CACHEFILES_DIO_BLOCK_SIZE - 1);
+	if (off) {
+		pre = CACHEFILES_DIO_BLOCK_SIZE - off;
+		if (pre >= len) {
+			netfs_write_subrequest_terminated(subreq, len, false);
+			return;
+		}
+		subreq->transferred += pre;
+		start += pre;
+		len -= pre;
+		iov_iter_advance(&subreq->io_iter, pre);
+	}
+
+	/* We also need to end on the cache granularity boundary */
+	post = len & (CACHEFILES_DIO_BLOCK_SIZE - 1);
+	if (post) {
+		len -= post;
+		if (len == 0) {
+			netfs_write_subrequest_terminated(subreq, post, false);
+			return;
+		}
+		iov_iter_truncate(&subreq->io_iter, len);
+	}
+
+	cachefiles_begin_secure(cache, &saved_cred);
+	ret = __cachefiles_prepare_write(object, cachefiles_cres_file(cres),
+					 &start, &len, len, true);
+	cachefiles_end_secure(cache, saved_cred);
+	if (ret < 0) {
+		netfs_write_subrequest_terminated(subreq, ret, false);
+		return;
+	}
+
+	cachefiles_write(&subreq->rreq->cache_resources,
+			 subreq->start, &subreq->io_iter,
+			 netfs_write_subrequest_terminated, subreq);
+}
+
 /*
  * Clean up an operation.
  */
@@ -638,8 +710,10 @@ static const struct netfs_cache_ops cachefiles_netfs_cache_ops = {
 	.end_operation		= cachefiles_end_operation,
 	.read			= cachefiles_read,
 	.write			= cachefiles_write,
+	.issue_write		= cachefiles_issue_write,
 	.prepare_read		= cachefiles_prepare_read,
 	.prepare_write		= cachefiles_prepare_write,
+	.prepare_write_subreq	= cachefiles_prepare_write_subreq,
 	.prepare_ondemand_read	= cachefiles_prepare_ondemand_read,
 	.query_occupancy	= cachefiles_query_occupancy,
 };

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


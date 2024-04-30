Return-Path: <linux-cachefs+bncBDLIXLMFVAERB4HTYOYQMGQEVHBPHSY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5D18B77F3
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:02:25 +0200 (CEST)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6a0cc6b1704sf40456816d6.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:02:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714485744; cv=pass;
        d=google.com; s=arc-20160816;
        b=i/lPE4RZZDZDKGEtv+RQ18oY43AmkusQhEiNH8uKcbq75yCiKVJeIxEPV7sDyDvd8f
         BIyakR42OIidQdDBSfK4GJ+N3ZVMm3JOHlmiYDiIqUmdVyZlaG48WE50jJ+sJYsU1s20
         WQrDkDtlof3n5O2qXfjrjJpH+6Bs3fMVtjOex9y8pzuMc2ZTAU7C8mu/XUNRlk2jzzpp
         /ErVUksc0wZm1ZIO///sDfYnyuSvCKvyyn45R6grkNO9FvPI0g1Ltm1wzHiZcqIE18j+
         d3CN0MHc59d9pn5CQsXNbWUJ0N0HOQC9pyJSlTB32Qc0wdCwmhhFSa7yGvHebwa4N5G8
         BytA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=TrUOXBLmeX3Jbgchvwm/B48VLA6ccWmJxZ6cnzCfvx8=;
        fh=jJoEpLIa97JSBQgk13zs7p/3mWF/ggJZHnje6JFaXpI=;
        b=SSTy84paOiR4bltMVDQv2S34mlS3StsHvSefaC59JtujIYWEVcgUKeRRDwuN1ZxFVw
         wwcD0or7aa26yMC+GWNZ20PM9gdiE5L0QwZjUaHYLK1uWxiVxqp4LlBL4H0u+1aGc1Ca
         YpvHyiv5mSr6sMnNWSFS9mo9XdsVLaJ2D3n0sXEZT+ZPhTsKFE5ckcPkDUvi17U/c+y3
         ymdKmVHaNSzNzcj5qIZDWljMysS2YH5WdCgf8hy2b3T3KfNIAoAJXjD4aLzPDolcNKoM
         fKDcEBpksnARMFOxRqVh2TllIKqT3M5S70xw7EEbEhZXyXaagPL+5wx6UxLKYOofajGW
         bbIw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485744; x=1715090544;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrUOXBLmeX3Jbgchvwm/B48VLA6ccWmJxZ6cnzCfvx8=;
        b=BLVla8L81Ex6lNrG8RuwyHZHIkJMJe8ikeDbqpQlSbDQ2buO3T63xdlG8wcz+O+PQU
         WiJKozVXyb+3iJvLYdGcyy6b98aFb8PEgEGkWMWBv5lKsWck2sDO4GXc0yt8OUK0ijgD
         o7FmdcTkVKqUNPXFeHd4bgX8112Y8/Qj04Bt7mEtcPED7TpmXLEXIjKf6Xx7hvkkYW7U
         73VHtrVXV+G5303QwbPFezarF6erDH0HbNAtqGU3oFcuAHn28iR0+upVQYTg3foDrx29
         BBlSgh9Pt0CtS6q7hI6uTRCBUUPxnLG/+MxdE5DRtYrjrjFQ7Fn5PjpFB3Q+HilHSLDe
         bxJQ==
X-Forwarded-Encrypted: i=2; AJvYcCX/uQOH5v0lNfYDd95OBm8GkdyHzomEyKsA7qeye9dipTsytj4o6bVmDEaN0OEDKl+nldQUB8GeRLt/CIJFBtQIywL3eDtbdu+5MvE=
X-Gm-Message-State: AOJu0Yy2rtcvthJH7nIxU0Rec6jlT4GVPYRA/KiSC3mbKFXdFgmAkQUc
	oTQd318Ekz0eMwh9PjUMR2QM25Bh+YzvcwjKbOjeR1VCqRQf0MW3YtdafLytJTE=
X-Google-Smtp-Source: AGHT+IESryQ0XN2GSu0vcGvYW01swten8ZLXhfZmHq20lVmu9e8SViLneDCoxbLxIqSppQfx+u2Xpw==
X-Received: by 2002:a05:6214:57d3:b0:6a0:d570:161a with SMTP id lw19-20020a05621457d300b006a0d570161amr4296013qvb.8.1714485744334;
        Tue, 30 Apr 2024 07:02:24 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:250c:b0:69b:a44:bb68 with SMTP id
 6a1803df08f44-6a09c4a8853ls1835496d6.0.-pod-prod-00-us; Tue, 30 Apr 2024
 07:02:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxnk3oGC8wTo2t80P/MhpW0R5UwHJnNAJTWr94CYj4EBQUpZQq3rv6A+5m7d2UktoeHxvih58jwcZXI8lSlTYtqKJTNgwTYlX+ReRrRJs=
X-Received: by 2002:a67:f854:0:b0:47b:9844:8f8 with SMTP id b20-20020a67f854000000b0047b984408f8mr2628615vsp.6.1714485743416;
        Tue, 30 Apr 2024 07:02:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485743; cv=none;
        d=google.com; s=arc-20160816;
        b=lymR2RO7ZXmL4aGwPqSWGTlPQB9MMz8YPkkySC4p7muHv60UTsdtOXqth4DjmIDrrg
         Vxd9W1leKWyG2YjDimt0VEX1dvAmHo41+a3OSEkXPTZKsIJMqPZJRaD/BnYRhDbF3z5y
         wPRxYGg4NRj+a8aPkXliimUSTqHT71l48tKTeBdPgPEk0bAvvHrQCsfGTvYnNpPbl+Q7
         TTXjia7/UMGt928wM8JlrqKxaV4tkmQM6waxF57r/UX5L+sYCIH7tIn6hu1lO+ArI0fe
         UJAqFHfpKNxpVuNJezWPjpDZoWeHAGq9NRZnzbDT8SY90rFPSoGjRz50CHWGMEXjKzYR
         St3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=b5EgDjFNrAAafAzZBTKxBCvxuUsmkAdGKL3AYN1EAj4=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=fuLUmjkznM45NWkA+7uGZVK+ot2T86szqyH/8s/59WHkbEeKpeNL9IzqbrKvuIqQFF
         WytzJnmNXRh8BhYd8CuJzwmiRptpJkjOsztmdjV3uY0mK2Tqt8zVF9TkpGShwd5bytFi
         XJy8B23pvlkQ7JXaRLLwr4xfm8mBDVECm//g928qIv1I6CEAmpsq1gUDW9QsmCxVzyrB
         wM0ZYY3haC/G2wAQMV3jKoCYiVS1kwgyJwOfxKaks7FyEgd6qVcFhKcbbqYUUXdRLg3g
         UtJwEVD6bcVVSROSSPZPHcrZLU2hzFi8efBRLdjMUWVc6GW+rnwhQzrZhUCa/GcF3DPx
         ygIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id k17-20020a056102117100b00479d904e3a8si4440180vsg.595.2024.04.30.07.02.23
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:23 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-235-i0NeJgawOliBJV2sz5FmXg-1; Tue,
 30 Apr 2024 10:02:15 -0400
X-MC-Unique: i0NeJgawOliBJV2sz5FmXg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE0103819C74
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:02:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id CA8DA581CC; Tue, 30 Apr 2024 14:02:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A59F2581CA;
	Tue, 30 Apr 2024 14:02:05 +0000 (UTC)
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
Subject: [PATCH v2 15/22] netfs: Add some write-side stats and clean up some stat names
Date: Tue, 30 Apr 2024 15:00:46 +0100
Message-ID: <20240430140056.261997-16-dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-1-dhowells@redhat.com>
References: <20240430140056.261997-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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

Add some write-side stats to count buffered writes, buffered writethrough,
and writepages calls.

Whilst we're at it, clean up the naming on some of the existing stats
counters and organise the output into two sets.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---
 fs/netfs/buffered_read.c  |  2 +-
 fs/netfs/buffered_write.c |  3 +++
 fs/netfs/direct_write.c   |  2 +-
 fs/netfs/internal.h       |  7 +++++--
 fs/netfs/stats.c          | 17 ++++++++++++-----
 fs/netfs/write_issue.c    |  1 +
 6 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 47603f08680e..a6bb03bea920 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -282,7 +282,7 @@ int netfs_read_folio(struct file *file, struct folio *folio)
 	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
 		goto discard;
 
-	netfs_stat(&netfs_n_rh_readpage);
+	netfs_stat(&netfs_n_rh_read_folio);
 	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
 
 	/* Set up the output buffer */
diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 84ac95ee4b4d..33ea4c20e7e7 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -210,6 +210,9 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 		if (!is_sync_kiocb(iocb))
 			wreq->iocb = iocb;
 		wreq->cleanup = netfs_cleanup_buffered_write;
+		netfs_stat(&netfs_n_wh_writethrough);
+	} else {
+		netfs_stat(&netfs_n_wh_buffered_write);
 	}
 
 	do {
diff --git a/fs/netfs/direct_write.c b/fs/netfs/direct_write.c
index 2b81cd4aae6e..36b6db504500 100644
--- a/fs/netfs/direct_write.c
+++ b/fs/netfs/direct_write.c
@@ -145,7 +145,7 @@ ssize_t netfs_unbuffered_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		return 0;
 
 	trace_netfs_write_iter(iocb, from);
-	netfs_stat(&netfs_n_rh_dio_write);
+	netfs_stat(&netfs_n_wh_dio_write);
 
 	ret = netfs_start_io_direct(inode);
 	if (ret < 0)
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index dc11d1f67363..5d3f74a70fa7 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -106,9 +106,8 @@ int netfs_end_writethrough(struct netfs_io_request *wreq, struct kiocb *iocb);
  */
 #ifdef CONFIG_NETFS_STATS
 extern atomic_t netfs_n_rh_dio_read;
-extern atomic_t netfs_n_rh_dio_write;
 extern atomic_t netfs_n_rh_readahead;
-extern atomic_t netfs_n_rh_readpage;
+extern atomic_t netfs_n_rh_read_folio;
 extern atomic_t netfs_n_rh_rreq;
 extern atomic_t netfs_n_rh_sreq;
 extern atomic_t netfs_n_rh_download;
@@ -125,6 +124,10 @@ extern atomic_t netfs_n_rh_write_begin;
 extern atomic_t netfs_n_rh_write_done;
 extern atomic_t netfs_n_rh_write_failed;
 extern atomic_t netfs_n_rh_write_zskip;
+extern atomic_t netfs_n_wh_buffered_write;
+extern atomic_t netfs_n_wh_writethrough;
+extern atomic_t netfs_n_wh_dio_write;
+extern atomic_t netfs_n_wh_writepages;
 extern atomic_t netfs_n_wh_wstream_conflict;
 extern atomic_t netfs_n_wh_upload;
 extern atomic_t netfs_n_wh_upload_done;
diff --git a/fs/netfs/stats.c b/fs/netfs/stats.c
index deeba9f9dcf5..0892768eea32 100644
--- a/fs/netfs/stats.c
+++ b/fs/netfs/stats.c
@@ -10,9 +10,8 @@
 #include "internal.h"
 
 atomic_t netfs_n_rh_dio_read;
-atomic_t netfs_n_rh_dio_write;
 atomic_t netfs_n_rh_readahead;
-atomic_t netfs_n_rh_readpage;
+atomic_t netfs_n_rh_read_folio;
 atomic_t netfs_n_rh_rreq;
 atomic_t netfs_n_rh_sreq;
 atomic_t netfs_n_rh_download;
@@ -29,6 +28,10 @@ atomic_t netfs_n_rh_write_begin;
 atomic_t netfs_n_rh_write_done;
 atomic_t netfs_n_rh_write_failed;
 atomic_t netfs_n_rh_write_zskip;
+atomic_t netfs_n_wh_buffered_write;
+atomic_t netfs_n_wh_writethrough;
+atomic_t netfs_n_wh_dio_write;
+atomic_t netfs_n_wh_writepages;
 atomic_t netfs_n_wh_wstream_conflict;
 atomic_t netfs_n_wh_upload;
 atomic_t netfs_n_wh_upload_done;
@@ -39,13 +42,17 @@ atomic_t netfs_n_wh_write_failed;
 
 int netfs_stats_show(struct seq_file *m, void *v)
 {
-	seq_printf(m, "Netfs  : DR=%u DW=%u RA=%u RP=%u WB=%u WBZ=%u\n",
+	seq_printf(m, "Netfs  : DR=%u RA=%u RF=%u WB=%u WBZ=%u\n",
 		   atomic_read(&netfs_n_rh_dio_read),
-		   atomic_read(&netfs_n_rh_dio_write),
 		   atomic_read(&netfs_n_rh_readahead),
-		   atomic_read(&netfs_n_rh_readpage),
+		   atomic_read(&netfs_n_rh_read_folio),
 		   atomic_read(&netfs_n_rh_write_begin),
 		   atomic_read(&netfs_n_rh_write_zskip));
+	seq_printf(m, "Netfs  : BW=%u WT=%u DW=%u WP=%u\n",
+		   atomic_read(&netfs_n_wh_buffered_write),
+		   atomic_read(&netfs_n_wh_writethrough),
+		   atomic_read(&netfs_n_wh_dio_write),
+		   atomic_read(&netfs_n_wh_writepages));
 	seq_printf(m, "Netfs  : ZR=%u sh=%u sk=%u\n",
 		   atomic_read(&netfs_n_rh_zero),
 		   atomic_read(&netfs_n_rh_short_read),
diff --git a/fs/netfs/write_issue.c b/fs/netfs/write_issue.c
index 0293b714d8ee..11b62e6f82fa 100644
--- a/fs/netfs/write_issue.c
+++ b/fs/netfs/write_issue.c
@@ -510,6 +510,7 @@ int new_netfs_writepages(struct address_space *mapping,
 	}
 
 	trace_netfs_write(wreq, netfs_write_trace_writeback);
+	netfs_stat(&netfs_n_wh_writepages);
 
 	do {
 		_debug("wbiter %lx %llx", folio->index, wreq->start + wreq->submitted);

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


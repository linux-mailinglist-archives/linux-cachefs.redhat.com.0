Return-Path: <linux-cachefs+bncBDLIXLMFVAERB45ZS2YAMGQEHAWLQ3Y@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEE589058B
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:38:12 +0100 (CET)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-5a5a08d1ed6sf894495eaf.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:38:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643891; cv=pass;
        d=google.com; s=arc-20160816;
        b=FRzEBi+dA8L5EiW8CaW+0K5LItk+KW69y90JeXgjQ03A4yKtVnNsVd9OM1Uqul0odS
         l2qJr6wOzgE5uuxz3tRD8cV3O2TUzZqwVJyvhbVahf9q9M6HcZIGVK+33keOLSR0+z5x
         bMMNhmaU73MZ/P9mzY6Yr5wxgYS0exTEQXujhBFa87Kg02H6XLKu3eCERV16xHLxuzmg
         GITi8DEy8AoT/SLVJe2+1LzDGOByAqQ4kKpfchDKzXpjalZ0mdh3kA/laC0jvoees7ob
         bFssVjYySCVpYECddlSC4Al5qBbCZtDhV89Y7PxpYaL2tQTlxP+XzEazIN0B5ZkcoRKs
         GoZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=eKqdL1ftJ9gyWZyHqmLFVtVzNnDO3zpVIfPgecD8NeI=;
        fh=0upjwvEsXyzDKFEScvkKV6uCVO8T7Ra1GKft4/a5vJA=;
        b=wfbERXhHcyiDqe9wbyw+o02x4G2VykVEIDpli1w9aL0zJOnbI3TIb+8iEI80xeCsb1
         t4nM5QlchTNYoqtyMH/QHw7bJ7ICUaffdQpwG64i//9WOzX+cFqhOrBEgf/H/8PuTWXR
         rb8pUT/+u8fQqdJ4zdR6uZlXnVZDyt1YpgWw99JjewKUOMJlhpnPMG8nbnP7dqTKOanl
         gpb8HpwV5hYTkOG60bPhJUjoobZTPtMr5WTdF/4Xqco0m8pIjLNFmoynIDAy0Gi7rxfB
         V8skcrrqxhNg4/Dt2MdqKHfiYtr8SGok3I+XPDxbPCeWE7xpL63u/IqqbkH35ZSzN/ID
         MJxA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643891; x=1712248691;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKqdL1ftJ9gyWZyHqmLFVtVzNnDO3zpVIfPgecD8NeI=;
        b=dhud3sKZsBdu6ARfeqEwNc4v0R96H7ZG4r3QboXjHN+PO186jNB0YFtBIQi6VyMayd
         WhirZxAdznk5FRSNcrMDdCAgjCBcfZtovZpEiLimkTtmaZpA3Jt/AyBtQDbrJXOn40cz
         KsW8Q/pTlzNrDTN1J3ooBaHcx4zzzF1Nk6TVpqFmvfyCANJpjazDy6WXIeFQmqGKu9Qh
         cewawmayE07oF+0CCpnUpjN0URkoybRwl+rgAUe9q0EWolzp5hYxmb5t+dOvq4212mH0
         o4jIyhv4CEZMHQcXjK9pzLlU0dhFw3pk5ZpUcQjFbyXIF5Iaw5ZTT/Chik4m3rIRVW2l
         FX1w==
X-Forwarded-Encrypted: i=2; AJvYcCWAJTBFM9uXYG+t5fWKD6dW5eadaxGA3d/j9qYyf9c2+6Nz5vxD5qL+gpMyWaEkJa87rBn7r7GJXo2GS8r446su/8A9eDVpYy0ZUNE=
X-Gm-Message-State: AOJu0Yx1IG6lXoBRkto4Z2pZ+HMHheOsthVOF83/V1/ZxATejSpTpIkH
	TGeJ9WDZV33IhybmOJZox1CsxYJLlLjFbtC5lgfrelFDZjb6Qz6OZeMP8OCEwXE=
X-Google-Smtp-Source: AGHT+IEscW20zcbBJ25TZAgGtvOL6Xj2QoamZkCki5Ad5xXPnPmDm2/Wx2B84HRtHWmv6XG0MDuEMg==
X-Received: by 2002:a4a:ba84:0:b0:5a1:bb9d:56a7 with SMTP id d4-20020a4aba84000000b005a1bb9d56a7mr2948027oop.8.1711643891216;
        Thu, 28 Mar 2024 09:38:11 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a4a:310a:0:b0:5a5:3068:ce1b with SMTP id k10-20020a4a310a000000b005a53068ce1bls1321568ooa.2.-pod-prod-09-us;
 Thu, 28 Mar 2024 09:38:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXw3me9v30BWmeMXapI5roWK9RUOg8j7/gMYXSM1OfwKwe43wIgayvBUcEi+4DwjMXnpah3drbBzKLO51fpao7iURYa+f2Qo0+IBesLoWU=
X-Received: by 2002:a05:6808:6503:b0:3c3:72ec:cb60 with SMTP id fm3-20020a056808650300b003c372eccb60mr4093233oib.49.1711643890416;
        Thu, 28 Mar 2024 09:38:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643890; cv=none;
        d=google.com; s=arc-20160816;
        b=mHVyZc1WWCP5EKPlImmXz2RosgaPtTsl0GeQHQrRJwq4yr8XdkYYdBoa/UqHgpNyLH
         0UhHb3gixva5qk0ShlkmXpWYZdO9+yeu0s2PSVqhsxlhq3iZyHgiuVdVaR/m5bEsy8+M
         51AukTFkUpDbePeAzfZFJQljWXIphNU+UjU5omcX0eeRa4BgWwQiKOr/KMUOlOeRKfzL
         FUEhadRmXl1SIbYsMyAxslTvBkXilrl1R8ZaIlRPbAiGZfPVwFboHv4Fg743rrlXGIRx
         VtklOJYns8oH9C6H8/BbMJfaDwBYaLt3ZKL3yfcUJa2mqTrFMrJUYPADp4oqZe2H2Pq0
         4xHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=JI9PX3u9k9FTrB5i0WWXWgMwPBin4UAr3u+00DhFGiU=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=KOqNGsI5H1M3XjeTjr6sVkxinnabm07tzHjd95BHJvAolQFOjDygz5WHbD0799gf4W
         Nva0CwnbBEBV+X+sjRP9W9UwtSEiT4EgPCJQ2cKrvOwqJ/Ts++yQgA0vbAqeU87nl7+x
         jVonGqz7k2F7hBdZ6Fbci4EHuzbjxqOgRoWMwVvS51QiYGNsLWEehChDmZp/PiW+NViH
         3sEA9PVN6imcyygsBlxjAltyU66F9jVu5dGaET4sf98FbQGl9EsK//QLjG6TSjADZ3Mc
         ZaEmvvCVo81uIveeZmee3mjfzCpRLjHvRfPQ+drrROwvnG5QwWnKNTJXHPGPU4/ffSMu
         cqeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id w10-20020a0cfc4a000000b0069681cda5f2si1759605qvp.222.2024.03.28.09.38.10
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:38:10 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-pBJI9IvlO1Gyf9YJn-ovCQ-1; Thu, 28 Mar 2024 12:38:08 -0400
X-MC-Unique: pBJI9IvlO1Gyf9YJn-ovCQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 673C2185A78E
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:38:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 63F131C05E1C; Thu, 28 Mar 2024 16:38:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B5A11C060D0;
	Thu, 28 Mar 2024 16:38:05 +0000 (UTC)
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
Subject: [PATCH 18/26] netfs: Add some write-side stats and clean up some stat names
Date: Thu, 28 Mar 2024 16:34:10 +0000
Message-ID: <20240328163424.2781320-19-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
cc: Jeff Layton <jlayton@kernel.org>
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---
 fs/netfs/buffered_read.c  |  2 +-
 fs/netfs/buffered_write.c |  3 +++
 fs/netfs/direct_write.c   |  2 +-
 fs/netfs/internal.h       |  7 +++++--
 fs/netfs/stats.c          | 17 ++++++++++++-----
 5 files changed, 22 insertions(+), 9 deletions(-)

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
index db4ad158948b..244d67a43972 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -215,6 +215,9 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 		if (!is_sync_kiocb(iocb))
 			wreq->iocb = iocb;
 		wreq->cleanup = netfs_cleanup_buffered_write;
+		netfs_stat(&netfs_n_wh_writethrough);
+	} else {
+		netfs_stat(&netfs_n_wh_buffered_write);
 	}
 
 	do {
diff --git a/fs/netfs/direct_write.c b/fs/netfs/direct_write.c
index bee047e20f5d..37c91188107b 100644
--- a/fs/netfs/direct_write.c
+++ b/fs/netfs/direct_write.c
@@ -143,7 +143,7 @@ ssize_t netfs_unbuffered_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		return 0;
 
 	trace_netfs_write_iter(iocb, from);
-	netfs_stat(&netfs_n_rh_dio_write);
+	netfs_stat(&netfs_n_wh_dio_write);
 
 	ret = netfs_start_io_direct(inode);
 	if (ret < 0)
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index c67da478cd2b..58289cc65e25 100644
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

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


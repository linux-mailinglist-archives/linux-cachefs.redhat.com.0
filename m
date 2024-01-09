Return-Path: <linux-cachefs+bncBDLIXLMFVAERBEGY6SWAMGQEYM7K5SA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com [209.85.219.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 877158284AD
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Jan 2024 12:20:49 +0100 (CET)
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-dbedc37d66csf2116845276.3
        for <lists+linux-cachefs@lfdr.de>; Tue, 09 Jan 2024 03:20:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704799248; cv=pass;
        d=google.com; s=arc-20160816;
        b=fy1dcVOcspGp5NndH57y93P+C3ik7nmNFqj1uCk06CA27bLjEBV/m08gpgFCXFU7VF
         8E4uWm9I/R5lwRKfB6tpowWkkqJc5gtJeC2f0pwhIogCQs1PaHi34JUi07NmDUx2JAAr
         WZlTyoZ37YXBimjTOh+61WRjAbwstYwseQFsNut9uD3U+Nk6gquJU2Z2DG3up73GCLIn
         RVLs2/C9iJVcOlAZsrCcCDxlcbvMdKLaKgPPEV0ThhHZY6imQex14X+e1qBAd/nZPvv2
         6ePe38+1VETZNqvuRZCEOH36aTtILlb/+yBZqUJyqA6oZVGdFsYQ321MHMlM/qjIzV7z
         lZ5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=VaQTsTtQC2mMkZga1gxtro2mIJXHPtSkaV/gW+hX5Hc=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=mAKAGNW71hRLqyornRVTc0gqU44FbgLUw2ea0Tqjz5GoDBZeL1wDSu5N7WQ6iOFBks
         MTf0OXn9D1fXk3FBeUPplWirEpi0bX1lRzougbiKb/AH2FDwatXzJmHkj0ErTqaB79Tw
         HOhSd1yMgx9qvR5rQtjFfPttkN+veCOAVqVcLkztsdi0fk1llT18ewbGSCU/nrwPzeh9
         7OZndSn6MsGj1EYlpE+surgAVYB8J1/BoFUZvVPkHBD4UAzPO40W5AN7QGKYFjOqWYJh
         0IdK8Rl4VSaRBlV95iYo2kXV8jpdhWjUF+0xr9rZmqgboHW/RPEJCGaJooGSuTTvjkpT
         aIGQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704799248; x=1705404048;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaQTsTtQC2mMkZga1gxtro2mIJXHPtSkaV/gW+hX5Hc=;
        b=KHrpnTvhXX0NFLrSsgT81rLd3wv5i8nJWKneyGzyuNU8QWKj6kmEvnAwGZXC5cC0ai
         fuRuIOjjdgA2+wL0CKkRJEIjT7bGLzSx9yaAibg+TVklQzgeVLRPIhshgrrQSsM56HWC
         bHgIyq4uEZ5QHe070qPYzkfGzBd9o8VQmo0Eu8m1orG82MxdtEa/SjThm+gObkGG9cgA
         DKmUeqETSKzLzVnwjMvAb/yXavjo6eWUmHy80SR22rjudSnCTvP6jV1GZHxzIKxBTUEh
         SM2Ike6fm0IBQTYkL2sSdhpxvhv4j4m0fCxBOuokXOaKnLJv5yYZRCmLgZtH//L6jAhY
         3lTA==
X-Gm-Message-State: AOJu0YwRvAPsAol7yttgPamZCOTtdZOfoXOnqXJvLkfqvRsFWCKdJWe4
	LiKrwKCM9/anHT6nOAL0Y+i+dFDpmRCD1w==
X-Google-Smtp-Source: AGHT+IG0Ou+tZodb94r4d7al3jnrAlSkc6CrJMdp4XOZPEVHSNCE+5fHqQ1Qc3XSOFuXnJEaf4fcgQ==
X-Received: by 2002:a05:6902:2404:b0:dbd:ae77:4662 with SMTP id dr4-20020a056902240400b00dbdae774662mr2708924ybb.32.1704799248419;
        Tue, 09 Jan 2024 03:20:48 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:df43:0:b0:dbd:f470:af0a with SMTP id w64-20020a25df43000000b00dbdf470af0als203799ybg.1.-pod-prod-02-us;
 Tue, 09 Jan 2024 03:20:48 -0800 (PST)
X-Received: by 2002:a25:414c:0:b0:dbe:d374:75a7 with SMTP id o73-20020a25414c000000b00dbed37475a7mr2166825yba.123.1704799247862;
        Tue, 09 Jan 2024 03:20:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704799247; cv=none;
        d=google.com; s=arc-20160816;
        b=0zjssZ3UwGPhoET4QBWYd13Zqtmv7ew/5I7+zV+9SxZmtNfHG3h2vzTyrh62JGHOPi
         BCYyCw2SFGlkP/118l8Zd9GZsQ+KYuC0NDlVJSzIAVZx8CAI98M/BupXxFrRdXugLCfd
         gjBKyovHjBWS0HHL4XGvkanVOmTEa3mnBJnMQhYOUKYX8VTy6LGv10uXqnT8fuLXoiR3
         O9wBEfM19G03tabbt+Z0jKn3hZwWbS7a0zWSBHkBYVmLFH29INHYiWN/KRyBEkkvPpIn
         I5drixZfWm8iyUa75ySsY7Q6xpyGcVVJczCW/JetLJMeCA8ZuAbj2NenTlE1Dhmfu1YW
         bq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=WPQwieeKN1qerHU6y651BO8nE/WRIhipjKm0fUBOfew=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=iRmAH69FdYDzjqD5K3+lwIcKrEaaKmP4vysOzMUwWfyR6fmpfrtqUYlhWMvPmVR+zv
         Tnst7u16ZhTc8/6uUv1y5MRCw2Pib+xPRoglxxw9n6I0hoyI/1xJEQbQ0LLPatKYVG8M
         VCnJ+gk43oGTJdQlkUfxNDePigW7uhdlxsOqS0PkwlraMDOc6Kaf7wOhqXe888rE52s8
         AJPMzmbSbTwwWQDwMIhTVJYmgHONHk3zTE64ZF9EyTpUv/x4IH8vG0PIB/seIz2R2FPF
         uGnJ3a73jZj3FnmsfOfZP/FLUe1bD9P1nyrAEcktxBHPxPD0dp5j0lyoLSI7R042Fshn
         GGjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id w13-20020a056902100d00b00dbf1562a5fesi165641ybt.708.2024.01.09.03.20.47
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 03:20:47 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135---3RW1zCOqSartcjntPCgg-1; Tue, 09 Jan 2024 06:20:46 -0500
X-MC-Unique: --3RW1zCOqSartcjntPCgg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9E2582A6C3
	for <linux-cachefs@gapps.redhat.com>; Tue,  9 Jan 2024 11:20:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id E61CD3C4F; Tue,  9 Jan 2024 11:20:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C7D83C39;
	Tue,  9 Jan 2024 11:20:42 +0000 (UTC)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] netfs: Count DIO writes
Date: Tue,  9 Jan 2024 11:20:19 +0000
Message-ID: <20240109112029.1572463-3-dhowells@redhat.com>
In-Reply-To: <20240109112029.1572463-1-dhowells@redhat.com>
References: <20240109112029.1572463-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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

Provide a counter for DIO writes to match that for DIO reads.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/direct_write.c |  1 +
 fs/netfs/internal.h     |  1 +
 fs/netfs/stats.c        | 11 +++++++----
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/netfs/direct_write.c b/fs/netfs/direct_write.c
index b9cbfd6a8a01..60a40d293c87 100644
--- a/fs/netfs/direct_write.c
+++ b/fs/netfs/direct_write.c
@@ -140,6 +140,7 @@ ssize_t netfs_unbuffered_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	_enter("%llx,%zx,%llx", iocb->ki_pos, iov_iter_count(from), i_size_read(inode));
 
 	trace_netfs_write_iter(iocb, from);
+	netfs_stat(&netfs_n_rh_dio_write);
 
 	ret = netfs_start_io_direct(inode);
 	if (ret < 0)
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index a6dfc8888377..3f9620d0fa63 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -104,6 +104,7 @@ int netfs_end_writethrough(struct netfs_io_request *wreq, struct kiocb *iocb);
  */
 #ifdef CONFIG_NETFS_STATS
 extern atomic_t netfs_n_rh_dio_read;
+extern atomic_t netfs_n_rh_dio_write;
 extern atomic_t netfs_n_rh_readahead;
 extern atomic_t netfs_n_rh_readpage;
 extern atomic_t netfs_n_rh_rreq;
diff --git a/fs/netfs/stats.c b/fs/netfs/stats.c
index 15fd5c3f0f39..42db36528d92 100644
--- a/fs/netfs/stats.c
+++ b/fs/netfs/stats.c
@@ -10,6 +10,7 @@
 #include "internal.h"
 
 atomic_t netfs_n_rh_dio_read;
+atomic_t netfs_n_rh_dio_write;
 atomic_t netfs_n_rh_readahead;
 atomic_t netfs_n_rh_readpage;
 atomic_t netfs_n_rh_rreq;
@@ -37,14 +38,13 @@ atomic_t netfs_n_wh_write_failed;
 
 int netfs_stats_show(struct seq_file *m, void *v)
 {
-	seq_printf(m, "Netfs  : DR=%u RA=%u RP=%u WB=%u WBZ=%u rr=%u sr=%u\n",
+	seq_printf(m, "Netfs  : DR=%u DW=%u RA=%u RP=%u WB=%u WBZ=%u\n",
 		   atomic_read(&netfs_n_rh_dio_read),
+		   atomic_read(&netfs_n_rh_dio_write),
 		   atomic_read(&netfs_n_rh_readahead),
 		   atomic_read(&netfs_n_rh_readpage),
 		   atomic_read(&netfs_n_rh_write_begin),
-		   atomic_read(&netfs_n_rh_write_zskip),
-		   atomic_read(&netfs_n_rh_rreq),
-		   atomic_read(&netfs_n_rh_sreq));
+		   atomic_read(&netfs_n_rh_write_zskip));
 	seq_printf(m, "Netfs  : ZR=%u sh=%u sk=%u\n",
 		   atomic_read(&netfs_n_rh_zero),
 		   atomic_read(&netfs_n_rh_short_read),
@@ -66,6 +66,9 @@ int netfs_stats_show(struct seq_file *m, void *v)
 		   atomic_read(&netfs_n_wh_write),
 		   atomic_read(&netfs_n_wh_write_done),
 		   atomic_read(&netfs_n_wh_write_failed));
+	seq_printf(m, "Netfs  : rr=%u sr=%u\n",
+		   atomic_read(&netfs_n_rh_rreq),
+		   atomic_read(&netfs_n_rh_sreq));
 	return fscache_stats_show(m);
 }
 EXPORT_SYMBOL(netfs_stats_show);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


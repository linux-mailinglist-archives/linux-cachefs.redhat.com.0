Return-Path: <linux-cachefs+bncBDLIXLMFVAERB5PPZCVQMGQE6UWSPPY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C4B80937B
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:24:06 +0100 (CET)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-423dba1e166sf17436511cf.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:24:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984245; cv=pass;
        d=google.com; s=arc-20160816;
        b=cuW+4CSxqVogIL0JGBNVnkeucwogFmlxEFNQU2QnyZYQXNVKoNEjO+Plk/X8IksDTm
         bmfe3WpAHauBGSNSxPuD/M6V35eMw4A8vmgxjnbH/Q7sbbbeg4Js6BUBFvh6DZsLMDn7
         QrkiBOjBANAO8Qhl3I5MKuKm2vpDlDzwXJKcTIkg9nyytpl3dY0T0iMObNSiLjJ/5xDB
         ehwIj5Yw58FDOrUxV+7aoNriFOW1TTZbDImyglxraKnWYvjSFNRVcg5Jmfa9tTXjM3ad
         hQFy718RuHPmW3j2o0fu/Jb8qSt1N+RomKxmWXX4PHMALVsmE/LSOkxs2meNdNNoIDuG
         9SCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=aGdbc1dlCoWlkbbzSe+0XwmCsp7YlBCfN+Vrf1Q25a8=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=agEV5ctEdd6gISGePFT1yGIosW4sQo2Kyi3gRIwZ2ZO83CDZw4pwsw4nuAl7xdG/Oq
         /69GlgqqyLkslIx/b4F18rtVzWHIJNcDVt7TKpIoF+Ywu5jkb0ore+6VXC1WzcyNcWIJ
         ggjPW46LX22L/lsQrPDFBey5cXowy6Q0ZAKUDJG1rGnOtLBxr8CEZsni+ShqLjRi7Rl+
         yRPCA3CmW8FPkPQDYEjr4Z/d5TID3zcXnl0vcD1v9Ecp+TLYfHwEjWdgkMnGTcN4Fa1l
         YKIjjGhHsHPXGzIi8CbDj1aL7rZYnMXBfToTEKDW8rhePVYrJ3PExZFHMD6me+/uw+Ji
         iK+Q==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984245; x=1702589045;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGdbc1dlCoWlkbbzSe+0XwmCsp7YlBCfN+Vrf1Q25a8=;
        b=Ok6IDrmQre3EB1piXFicCwL/Eq8Y0n/1nCWkoFRw3YRxXuLX6kzzCjdvywp+GSaKfP
         ImtDAWyipZL0lLt6tNckZ9+CtK90T9icjiGMn/NDpkCFSqIA/wm5EQTu/lHApasYboCH
         2Wq6LbGffFQJAO6gVElThBITpH7DxAprxfBWhLANbkJZo4R6IZuvpIXge8hWDZ+iN+k2
         Omdbf9V5tJzxor4z/Q8xG7WpTH+Ey2rOGkAMiOvkcBarhX9hOGWmRlpawJDNadU3ry6v
         +nho65BIOf+R+7iU5gOMMyVWZVgFuYgzG6sCJULo8MZJm3xqpjIeaijAjle4J3xbD4ii
         dGkQ==
X-Gm-Message-State: AOJu0YzE+DRX+jYatkQAfqngOg20p66O1TvswEqJ9rGRCswPUIpc2N+c
	Gz7r4IBoJYAPj/fyVloOovnuWg==
X-Google-Smtp-Source: AGHT+IEXM6LxYGve4lt32GUGJ/quXoG3LzY4355PDNx4d0VSA69O9WWZcfLg1ESeNB3n2Ngl+1RVlQ==
X-Received: by 2002:a05:622a:211:b0:425:962a:1973 with SMTP id b17-20020a05622a021100b00425962a1973mr958352qtx.137.1701984245294;
        Thu, 07 Dec 2023 13:24:05 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1a20:b0:423:731a:7859 with SMTP id
 f32-20020a05622a1a2000b00423731a7859ls507779qtb.0.-pod-prod-09-us; Thu, 07
 Dec 2023 13:24:04 -0800 (PST)
X-Received: by 2002:a05:620a:3c09:b0:77f:9d5:185b with SMTP id tn9-20020a05620a3c0900b0077f09d5185bmr1825046qkn.25.1701984244751;
        Thu, 07 Dec 2023 13:24:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984244; cv=none;
        d=google.com; s=arc-20160816;
        b=oLekRazp6DIfzMWoWEo4jJdIHANrXE4h8f1S+RjPWi2dlQxOfqn91FpeReoTge6kcg
         v5O0W7LqLTDNZE6suOuwQ+A02CQTxxMHFWjKRg3VwcEm0IsEiO6j2pP6kIToOq3c/tQl
         0v0WwafKTeasMbOm+guptkZOhrh3In1q13KCaL169nu+MBNt5NZXIWhSkovdx38pjMyq
         iG5+18j29Rd2PcYeLAWcFIyJ+rox+YweDYKgrmYxdifPmwosLa3SdzDL84a2mnge8fXd
         4qKjE64aBVwbNuKOZ4acic62wgkN2u+L+kfTP/CSzhxJvECGlQ8J7uRbnsXStXQ9Lnh2
         8DoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=BBeV+gPa6exSN5f9Ij71agEQGyyesbGBrZnLGz9yhJU=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=NfxIxm4joi8ASAV29+nf6Nukg5cTJLxIeG+L0JUDKFmHq4LgHyzN72pqiZ61BWKiKT
         L4feSBFCXVL4o7L37iktV10n4Le+KM5xALj2/YJXgaNv/ND02kxPBaC2HELGjLe9ygDp
         DxFoFFbsLRKtwAEOf+lM+SgHKmJFeqRSk4aXvl0ZTfdI3jIi+79rvU8NX7vfZA/HX21M
         m2WJR8ReW3QZd/pcW8gcmDECJ0D4z6ASxJwyfX1OHc/NAaDAIz/91Rx79XA81UlpgFdw
         5gv9eNhsga0jMeSTBvrp4ST8qeJ5QWLrbaXQA9onIMyMyWXXmGsy2bohT8/cNjMUWR8L
         8uEA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id q8-20020a05620a0d8800b0077d708299besi610162qkl.425.2023.12.07.13.24.04
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:24:04 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-513-c5k2d5eHNguavZ-p3pd7fw-1; Thu,
 07 Dec 2023 16:24:03 -0500
X-MC-Unique: c5k2d5eHNguavZ-p3pd7fw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D2B729AC016
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:24:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 199C43C32; Thu,  7 Dec 2023 21:24:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E8473C35;
	Thu,  7 Dec 2023 21:23:59 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 32/59] netfs: Provide netfs_file_read_iter()
Date: Thu,  7 Dec 2023 21:21:39 +0000
Message-ID: <20231207212206.1379128-33-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
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

Provide a top-level-ish function that can be pointed to directly by
->read_iter file op.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_read.c | 73 ++++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h    |  2 ++
 2 files changed, 75 insertions(+)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 950f63fc156a..a59e7b2edaac 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -558,3 +558,76 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
 	_leave(" = %d", ret);
 	return ret;
 }
+
+/**
+ * netfs_buffered_read_iter - Filesystem buffered I/O read routine
+ * @iocb: kernel I/O control block
+ * @iter: destination for the data read
+ *
+ * This is the ->read_iter() routine for all filesystems that can use the page
+ * cache directly.
+ *
+ * The IOCB_NOWAIT flag in iocb->ki_flags indicates that -EAGAIN shall be
+ * returned when no data can be read without waiting for I/O requests to
+ * complete; it doesn't prevent readahead.
+ *
+ * The IOCB_NOIO flag in iocb->ki_flags indicates that no new I/O requests
+ * shall be made for the read or for readahead.  When no data can be read,
+ * -EAGAIN shall be returned.  When readahead would be triggered, a partial,
+ * possibly empty read shall be returned.
+ *
+ * Return:
+ * * number of bytes copied, even for partial reads
+ * * negative error code (or 0 if IOCB_NOIO) if nothing was read
+ */
+ssize_t netfs_buffered_read_iter(struct kiocb *iocb, struct iov_iter *iter)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+	struct netfs_inode *ictx = netfs_inode(inode);
+	ssize_t ret;
+
+	if (WARN_ON_ONCE((iocb->ki_flags & IOCB_DIRECT) ||
+			 test_bit(NETFS_ICTX_UNBUFFERED, &ictx->flags)))
+		return -EINVAL;
+
+	ret = netfs_start_io_read(inode);
+	if (ret == 0) {
+		ret = filemap_read(iocb, iter, 0);
+		netfs_end_io_read(inode);
+	}
+	return ret;
+}
+EXPORT_SYMBOL(netfs_buffered_read_iter);
+
+/**
+ * netfs_file_read_iter - Generic filesystem read routine
+ * @iocb: kernel I/O control block
+ * @iter: destination for the data read
+ *
+ * This is the ->read_iter() routine for all filesystems that can use the page
+ * cache directly.
+ *
+ * The IOCB_NOWAIT flag in iocb->ki_flags indicates that -EAGAIN shall be
+ * returned when no data can be read without waiting for I/O requests to
+ * complete; it doesn't prevent readahead.
+ *
+ * The IOCB_NOIO flag in iocb->ki_flags indicates that no new I/O requests
+ * shall be made for the read or for readahead.  When no data can be read,
+ * -EAGAIN shall be returned.  When readahead would be triggered, a partial,
+ * possibly empty read shall be returned.
+ *
+ * Return:
+ * * number of bytes copied, even for partial reads
+ * * negative error code (or 0 if IOCB_NOIO) if nothing was read
+ */
+ssize_t netfs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
+{
+	struct netfs_inode *ictx = netfs_inode(iocb->ki_filp->f_mapping->host);
+
+	if ((iocb->ki_flags & IOCB_DIRECT) ||
+	    test_bit(NETFS_ICTX_UNBUFFERED, &ictx->flags))
+		return netfs_unbuffered_read_iter(iocb, iter);
+
+	return netfs_buffered_read_iter(iocb, iter);
+}
+EXPORT_SYMBOL(netfs_file_read_iter);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 46c0a6b45bb8..638f42fdaef5 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -381,6 +381,8 @@ struct netfs_cache_ops {
 
 /* High-level read API. */
 ssize_t netfs_unbuffered_read_iter(struct kiocb *iocb, struct iov_iter *iter);
+ssize_t netfs_buffered_read_iter(struct kiocb *iocb, struct iov_iter *iter);
+ssize_t netfs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter);
 
 /* High-level write API */
 ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


Return-Path: <linux-cachefs+bncBDLIXLMFVAERBGU246VQMGQEPXVJWAQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 15484811670
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:26:20 +0100 (CET)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-58d6987da39sf8018227eaf.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:26:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481179; cv=pass;
        d=google.com; s=arc-20160816;
        b=jjmq2z7Kl059i425QFx+wThDZ+PrKLFfAxrXcr1qKVm5OKqIVbXUbAcrQyEeG0ptTh
         v7qxolz/6nAENSYUQs22taMWMnIyRh8K5o34zs9uxfd/IiRnN8Fs/gPmCIceoK2SU6lf
         7ljTVmyJLFBDNubEuc+YRotKgDqf5CVH8hPF0WqdsU7SgAmqMTzJmMZH74a3BD2WGz4U
         QSPcWhTwLY6KKbMDMEGZHYEJ7wwaT5p29SS2Yki9lyqis6LSY6pH6QuVinxqM0A76wil
         hvc7+jNKa1z6DfA4PwT4HxDagtsenTm1fHWUqL21w+pE7EVoPnn5IFF5/nFpC8AI1kzz
         0qqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=aGdbc1dlCoWlkbbzSe+0XwmCsp7YlBCfN+Vrf1Q25a8=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=QCVeDKe2bGqNBfwpl9YRYxZM/lOyj9ZgVbM9RZzKc94b45t/61lHU234NI0RKEoF8v
         sx5I8u0ppcInJtuKmH1/HuSqcHwAcS9Y/mYc2OVk4wpkJk48zAfD0y2nG+9JG4DY+gRm
         aXMWQn+lUJ0yGy7wnI450StI0hZ9B2/eDOBfIty52Sr+WkQqmspGQvXtX0kQc8IRPzb/
         xQ9ARm4bnnM3qwzXHxTS2wSAPEbldT1ZCDoELs/yamnwfzYuA+BR5dX1gIePvIcNr5Vj
         Zag4aHxdJPabzJvUruWbZPJKkrtaxM+8lydbJajG5wl8PvUiTXMJCfQWDEJY7mocml2S
         efMA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481179; x=1703085979;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGdbc1dlCoWlkbbzSe+0XwmCsp7YlBCfN+Vrf1Q25a8=;
        b=WTOS24tYj8AykF7GC4qYG+adhESP2WZKHqMwrpkMmkkyjVG9L80gF/WVPkxV0ufLzD
         i5TDdwNl5q06v80qSetysvagUTWC4ZwgbNF22aaaY3Ti+/jtjSiPUhiFsSzdID/TlRns
         RyG8pA9FhQp2rEJu7JJEO0X4fTYagNYTZ2hzwykaPZVroqFLMM+SFec3/0SOvg+FING/
         XBxUDF7PZGuejZTw8BnOskkEfss9VWynarAHl0UYw1uZvTUmbp1+Gqf+yglQDh+rT2ZQ
         bez2f0eispZqbzQVLf0In7EVP9rF6ep7Pfm//9+I5RtK+Xsj0FewlHZ4NsHSpbpkf9mO
         qrjQ==
X-Gm-Message-State: AOJu0Yxm8roFF5PZ6iBYNJpuxsV6TtuIsLxcJRwkx6z8iTeRyKLeTglY
	jD7GHGtrKUkTrU7r0i5x0DOBsQ==
X-Google-Smtp-Source: AGHT+IFpq2kOqb1Wviy7+LfkwJawFTljL026F6JukGgdizbPvFC9hlLuoEtc3wgdNlhLZmrvpTIcmQ==
X-Received: by 2002:a05:6820:22a4:b0:58d:c53:ec10 with SMTP id ck36-20020a05682022a400b0058d0c53ec10mr7722574oob.7.1702481178874;
        Wed, 13 Dec 2023 07:26:18 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:221b:b0:58d:9e35:a9fe with SMTP id
 cj27-20020a056820221b00b0058d9e35a9fels584006oob.1.-pod-prod-08-us; Wed, 13
 Dec 2023 07:26:18 -0800 (PST)
X-Received: by 2002:a05:6830:2049:b0:6d8:74e2:b001 with SMTP id f9-20020a056830204900b006d874e2b001mr9130689otp.63.1702481178334;
        Wed, 13 Dec 2023 07:26:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481178; cv=none;
        d=google.com; s=arc-20160816;
        b=y6B7c7u4ys6oYfMJkx7GagW8BqfrNmIOg+VCTG2MqJ6EFv7YSFlYss+zU6s4UzIk3m
         QmuQaKI5LdEZDLv8ZeQu4nTT10lbVSfTL82jygcV6ugQEHzXOJ0MJDPAGBUZo+V71THm
         A+kr2wun11GotRujLX7PIwPDeS6I5T5e7c3DNcAiFhZaL+v12niIMekFSzkvCfl1t8zH
         /0p+O/oqCbJYEZjqhnUt5FeWqnzsyhki26Iwcl3ONltgIv80wnczWVk5lO5JOaSxy1fC
         1pYQ4WBWonGsZTyp6b5T6/Gb66RjIh+jO8SVO3T/bVro52z3PYv1Co4THGHA3D4hC+4w
         Sq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=BBeV+gPa6exSN5f9Ij71agEQGyyesbGBrZnLGz9yhJU=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=rFR+7jq3gzqPgZZE6t8NnCQlShLA8g/0ahPojgguHXWdQf7u7j1V0Rs1aja4i1Z6id
         ewI2Y3mTU2ksK7+2lTsXHBy/ywgQzvyhiAuFDYpoViPewuBVXW+6qQT7PYQPxg6UsuG9
         ARBr8fSY0IJzd9U/cS97QdEsokLiqsk9TKRtjNRipn6oA/ukqjMT+U16Jd2oa0j0QhZY
         Jqbqo1OZAk/JjpE5IUnkcXH41Az9egqyMzOD3O0Md9dOkn4qdWsL/vBCbuTU5egQ7NT3
         e5i/ynODonhK8oY8FQJ8xgydHmiXoJ1RAxLGnFaJsqJa3ZHwhIdlJQHi256+R2ku/KWb
         E2ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id bn24-20020a0561220f1800b004b2ccc68d86si2762176vkb.127.2023.12.13.07.26.18
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:26:18 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-3MeGmr4DPLi1OXTEwMy1yg-1; Wed, 13 Dec 2023 10:26:16 -0500
X-MC-Unique: 3MeGmr4DPLi1OXTEwMy1yg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DB27101A551
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:26:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 5AACE2026F95; Wed, 13 Dec 2023 15:26:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF03B2026D66;
	Wed, 13 Dec 2023 15:26:12 +0000 (UTC)
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
Subject: [PATCH v4 32/39] netfs: Provide netfs_file_read_iter()
Date: Wed, 13 Dec 2023 15:23:42 +0000
Message-ID: <20231213152350.431591-33-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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


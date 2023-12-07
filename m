Return-Path: <linux-cachefs+bncBDLIXLMFVAERB3XPZCVQMGQE6ZEGG2A@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B741809375
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:23:59 +0100 (CET)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1faf33fe0easf2629438fac.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:23:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984238; cv=pass;
        d=google.com; s=arc-20160816;
        b=Nx1/A3LZtwki7HECXfKNYpe+DeieGQ60ZTOmLmHgJ4jz9LAh4rynoXY6QE+PovI7Xu
         prGhy6cXU8WhH5S+drVW7HIB107Vj/gDPqkiAEIc9U9ZIE5wAaVP3ZFxzHJJj7FW6bJM
         sKXQYw1x0JmKgRgXd4ixybTgjExDk2nPpc9hqNBzQSEqSm6KQvJHv5aPCGo/R00n4sFs
         eR/xqxEdcg5wJTS28HtSzqWpI9xm+wlvXZUPqJtkkdMn5vZxAt1mV+gbMLEPsIPf0lpJ
         RHGVXzCtbpkMUXFhRNSUqrzDfn/xbrdu0QlXPDQmG2VQomdSmP+dPAGJdRQEIKmupEsy
         LwCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=3aTkRg0DPwu4PVISQUGMqg/3RIYNnTXsy19sWNGeBVc=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=MWQNRCnUx7IFCwQz0lMdOi5izZmYWR5jLzjhBQbctQbvM8QcFpWcxKN9DTNhJHzURm
         apxe7XdYhgKGByT7LA4AyhQIYCEPTURT6EE3GwOt/V/9HcS/2nBp2j2tEFDkiHlZ/Oib
         hR3YbB2rSmXVafdTHJxX6dOj/DvH6WDYnzOu2Ii1w7oOMsWyhvj239MytXR3xaLyn8uo
         yFiG6RMNuLOcznQwccezh3cyD2x74dsFcbjAKh0xY9UmK8DljeqROy5Pw0KGLL8r+mQ8
         OXRYqYYu4SsZHaVOZwnLLxf/f5EOI5QfLcFHoTvwnLXXGG49HpOP9PFFYnRs3EQOtMpg
         zrOQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984238; x=1702589038;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aTkRg0DPwu4PVISQUGMqg/3RIYNnTXsy19sWNGeBVc=;
        b=rsecy0Wy4kC/PrcBz1cOwk5Yn/Up6deVFzirNSjbCZTsPydvxl0BamussqX3aF9Tqw
         +Pbe5FOMHj6O78QsTGdX+1ETUmC8lxdaS3KGXPppFDR3/nLiyhFxGnB1JykNu9d/nLmH
         p+jwXZRtB6xqxpN5gAbgaZHlxWF2FOP26HLKosmutJbWdtQxNijRnbPk3WENqy+vOpZ6
         XV/kyd1+pS2VPoVEHCQ5Flsd+DviRKy+gc19agF1eDLv15DyUvzkL/K9uW6aUvj2gAHK
         4fdzCWzCyCkZlWxIm3WdUHzT8gIpjZbnhOvQZJDB7lWXxk4z484U0Lyztxhu2jCULzMc
         invA==
X-Gm-Message-State: AOJu0YxqIPm13HG6haznffkzXqn/NNXQQo8nifpbmreRUCfhnFVxHrNV
	73C2neq2IgH0u2aJ/hOZsLXC0Q==
X-Google-Smtp-Source: AGHT+IGKA9niRA1kzVKHx+HfazU+18UtdIMDCrgv6lFrMS+6MeGVUNvYmcSKQQDF3s3LQyRMtOPgoA==
X-Received: by 2002:a05:6871:53ce:b0:1fa:2b7a:9ece with SMTP id hz14-20020a05687153ce00b001fa2b7a9ecemr3833457oac.46.1701984238149;
        Thu, 07 Dec 2023 13:23:58 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:3d9b:b0:1fb:29aa:69d3 with SMTP id
 lm27-20020a0568703d9b00b001fb29aa69d3ls2408610oab.2.-pod-prod-05-us; Thu, 07
 Dec 2023 13:23:57 -0800 (PST)
X-Received: by 2002:a05:6870:f111:b0:1fa:2602:2e9 with SMTP id k17-20020a056870f11100b001fa260202e9mr3930438oac.8.1701984237657;
        Thu, 07 Dec 2023 13:23:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984237; cv=none;
        d=google.com; s=arc-20160816;
        b=H9+yoFj1TQ4tHN/X4N4N2hybMBSznAvnohrd5hdhajoNKfyu9fK7Iax8AzROBQ19iF
         nOUaJy/5OhMWq8pUMz7UCMt8Q8uyv6XCxY9WUI2LiTwpI+TC0XHZQZ3F4NMRyIEn6zRa
         Pu/TVTwXFAL8AZ1bhFU61p0lmWFKO36b6VNhl2MKV231qF05CH53+NQERZX44aa4VIPV
         qK4FbOAHuZgb3hVmp00l0iDYpX/qHrBHmNehrxoTVpeS7LoRVAHES8Qk9nDCh5Hcw+fw
         4i4mOD6mKSjzaAzXju6zRMA19BYx4/L+ako8VfZxxCsVZjmS2FVcIMCA2o4Yj6NeGzcY
         eugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=bK45Roxm3IC/nkVEsH43k2qGwF+l+q9rJ2GGBczBW+0=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=S3CwjEGF1zD8t+AxicsFN05ifk/JVc8nU4zXMTxca4jtE0OWU1CJ23AgLjIEOhhz2i
         hMMPghRJiakfgZErG9jZfXLfFfNPojdhJqbPyueG2C/h2whzsrQuIuh1e27BfgngyMqU
         9bkf45ztv+VIcc7Vvcwu11BbdCUfXf14kXmB19iGFFzX31uCayMKmxFqAt6DaJ1KYHW0
         aVcOUZz9PCxuQ83dsK9ExdHY3hy+IWKEqVmFrG7QqDIVRLrgWzitgyNnQlef9UHXY1hT
         2OlkGsCGYYbG07WrEhNuMNvuk1SkBgSHE1MjFnoZZ66Pq4oK3/299uyyOQmaVgHlJK2X
         nSEw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id fa14-20020a05622a4cce00b004237b1fca88si695089qtb.737.2023.12.07.13.23.57
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:23:57 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-lBbFdb0ROK2R0QLT4D-xIA-1; Thu, 07 Dec 2023 16:23:55 -0500
X-MC-Unique: lBbFdb0ROK2R0QLT4D-xIA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 617E186C047
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:23:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 5E32D1C060AF; Thu,  7 Dec 2023 21:23:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF5661C060BC;
	Thu,  7 Dec 2023 21:23:52 +0000 (UTC)
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
Subject: [PATCH v3 30/59] netfs: Implement buffered write API
Date: Thu,  7 Dec 2023 21:21:37 +0000
Message-ID: <20231207212206.1379128-31-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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

Institute a netfs write helper, netfs_file_write_iter(), to be pointed at
by the network filesystem ->write_iter() call.  Make it handled buffered
writes by calling the previously defined netfs_perform_write() to copy the
source data into the pagecache.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_write.c | 83 +++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h     |  3 ++
 2 files changed, 86 insertions(+)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index b76688e98f81..f244123ab568 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -333,3 +333,86 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 	goto out;
 }
 EXPORT_SYMBOL(netfs_perform_write);
+
+/**
+ * netfs_buffered_write_iter_locked - write data to a file
+ * @iocb:	IO state structure (file, offset, etc.)
+ * @from:	iov_iter with data to write
+ * @netfs_group: Grouping for dirty pages (eg. ceph snaps).
+ *
+ * This function does all the work needed for actually writing data to a
+ * file. It does all basic checks, removes SUID from the file, updates
+ * modification times and calls proper subroutines depending on whether we
+ * do direct IO or a standard buffered write.
+ *
+ * The caller must hold appropriate locks around this function and have called
+ * generic_write_checks() already.  The caller is also responsible for doing
+ * any necessary syncing afterwards.
+ *
+ * This function does *not* take care of syncing data in case of O_SYNC write.
+ * A caller has to handle it. This is mainly due to the fact that we want to
+ * avoid syncing under i_rwsem.
+ *
+ * Return:
+ * * number of bytes written, even for truncated writes
+ * * negative error code if no data has been written at all
+ */
+ssize_t netfs_buffered_write_iter_locked(struct kiocb *iocb, struct iov_iter *from,
+					 struct netfs_group *netfs_group)
+{
+	struct file *file = iocb->ki_filp;
+	ssize_t ret;
+
+	trace_netfs_write_iter(iocb, from);
+
+	ret = file_remove_privs(file);
+	if (ret)
+		return ret;
+
+	ret = file_update_time(file);
+	if (ret)
+		return ret;
+
+	return netfs_perform_write(iocb, from, netfs_group);
+}
+EXPORT_SYMBOL(netfs_buffered_write_iter_locked);
+
+/**
+ * netfs_file_write_iter - write data to a file
+ * @iocb: IO state structure
+ * @from: iov_iter with data to write
+ *
+ * Perform a write to a file, writing into the pagecache if possible and doing
+ * an unbuffered write instead if not.
+ *
+ * Return:
+ * * Negative error code if no data has been written at all of
+ *   vfs_fsync_range() failed for a synchronous write
+ * * Number of bytes written, even for truncated writes
+ */
+ssize_t netfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
+{
+	struct file *file = iocb->ki_filp;
+	struct inode *inode = file->f_mapping->host;
+	struct netfs_inode *ictx = netfs_inode(inode);
+	ssize_t ret;
+
+	_enter("%llx,%zx,%llx", iocb->ki_pos, iov_iter_count(from), i_size_read(inode));
+
+	if ((iocb->ki_flags & IOCB_DIRECT) ||
+	    test_bit(NETFS_ICTX_UNBUFFERED, &ictx->flags))
+		return netfs_unbuffered_write_iter(iocb, from);
+
+	ret = netfs_start_io_write(inode);
+	if (ret < 0)
+		return ret;
+
+	ret = generic_write_checks(iocb, from);
+	if (ret > 0)
+		ret = netfs_buffered_write_iter_locked(iocb, from, NULL);
+	netfs_end_io_write(inode);
+	if (ret > 0)
+		ret = generic_write_sync(iocb, ret);
+	return ret;
+}
+EXPORT_SYMBOL(netfs_file_write_iter);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 00c87f4e809c..702b864a4993 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -385,7 +385,10 @@ ssize_t netfs_unbuffered_read_iter(struct kiocb *iocb, struct iov_iter *iter);
 /* High-level write API */
 ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 			    struct netfs_group *netfs_group);
+ssize_t netfs_buffered_write_iter_locked(struct kiocb *iocb, struct iov_iter *from,
+					 struct netfs_group *netfs_group);
 ssize_t netfs_unbuffered_write_iter(struct kiocb *iocb, struct iov_iter *from);
+ssize_t netfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from);
 
 /* Address operations API */
 struct readahead_control;

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


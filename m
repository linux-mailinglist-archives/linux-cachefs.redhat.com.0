Return-Path: <linux-cachefs+bncBDLIXLMFVAERB7NQ36VAMGQEHMN6EFY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C55F7EF9B1
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:17:50 +0100 (CET)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6d31f3feb10sf2287611a34.2
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:17:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255869; cv=pass;
        d=google.com; s=arc-20160816;
        b=rjaAMTUqzMclFFm+ZKOR9bDRcR+HTS6U+KCSENxMt1EwL60PU4t5JC4tGXcNFgk6DH
         QQypgCuBkec7kMxiVPX4DEg04V4Uhbs01QYxYTA9x4gz3YZkSa9sQFsaDktEl/U8ZrKr
         tK/rzruSv8JZAQAjIRJimONQ61erLlqLsyPkzA3XJCdnpspMiG8HK5z5uF1KpeppltiT
         eJWorlPOcGrzQlQ9mMYFvAyiBo3R269U0+2eF4eDn/T77ifY230H90KSPxUT+LAJ3XXx
         xLMV2RfgyyFZbXowAxlFE/Xw2XVS82wEJaSBZmjhQYYosVTGkHgUhKSp3/G/xGVW4dGd
         xqBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=tzDcBajtiBHV6Umt/m+2LVJMkdkX/zhlBB56Ezra8/s=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=pQj7kVidZWmlR2h5LE1FNkcMj1F5NJCk++Tc2x63WdztpLfVZz6mAkeiQ62zBQ13un
         ymDgNym5+LJZTArVT9AH77/vAC81nqC3RFS8/OPqHglC7Ub8hJ+cfj7RG1KF8nWqoh8F
         TPk0+h8yliLq7E+xbvRSzinEJaz5N2RabdTvAYNRlvyY1q1aa8kLf+DhGcGpc0xnXnK9
         GFeIEd2F0JLjUDn6G0ezx3UUkSegVYNEOoSv0sNNxHG8G2pF/a5XU3lN1xrHKnXhLn5P
         h3VS9vt1npqfiJbQhkrSVa0dFD79lr94ta9siKXi1hg6GNpYlo52SMBB+jqVBv2eqq1c
         ZJtQ==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255869; x=1700860669;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzDcBajtiBHV6Umt/m+2LVJMkdkX/zhlBB56Ezra8/s=;
        b=Arn6GmiW/Sf9LgOnYazD5L3b3WGGOZmci4czb8k2EpG77Hsr6SZTPeED7vUZFnKiud
         GVB0XQz9nl77nodIRaz9uRclxAqcbM1Cd+fs1khk8IEUr3Ue5Y4y118q2M9nY7C2HPaZ
         LhZ8tHNa8uOpPxwvTdCqxnZ0d/c8VmYQJyjMHAZnmX9+tEy+wdBM94X9VGWnFLZrbVSW
         Rnm/U7TWxW11VOUe25KedeAjHplIKuApeXvjQIPZpmUV46Hr4sBWXBKNXBtHNywW+DO9
         yDQg3J6F7DLsJcqZdk8A+GOPGsZhNI8mhVuPEDrLvX7HrDCcw+KjC3FpyMRpAgqsvlxG
         J97w==
X-Gm-Message-State: AOJu0YyU0nzEZM385rBeFMvas9LGYDFaI0+mYwB/PzeT4J9LukyrJuH4
	80qnfTwEnJGntCW8TmSZMRga3w==
X-Google-Smtp-Source: AGHT+IEH0vWI9ZkRA2y90HcJnwqqWrAb2FZ7NuDA+DZ1iq3Cw9beinUz/upqYTl0dr2xhhs3eWZLng==
X-Received: by 2002:a05:6870:c1d2:b0:1e9:8b78:899c with SMTP id i18-20020a056870c1d200b001e98b78899cmr527047oad.55.1700255869189;
        Fri, 17 Nov 2023 13:17:49 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:5754:0:b0:41e:8a0a:bbc3 with SMTP id 20-20020ac85754000000b0041e8a0abbc3ls2152890qtx.2.-pod-prod-02-us;
 Fri, 17 Nov 2023 13:17:48 -0800 (PST)
X-Received: by 2002:a05:620a:b87:b0:77b:d0f0:966a with SMTP id k7-20020a05620a0b8700b0077bd0f0966amr701114qkh.13.1700255868511;
        Fri, 17 Nov 2023 13:17:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255868; cv=none;
        d=google.com; s=arc-20160816;
        b=mQnF5Tl4XgWJ8U9oujE68bIh0Tv89Iu0yTZOEz6dMB73uj2YZPmdoZ38a23O/ehXEk
         DjPzSV44bLiQvLIfquEANSBbrR9yKMs5w3apbz32KSNiyA7hfLrb+VoMijnOqNi7SFOo
         LgL8H0XDqXEAkUmt41txruovZoLo+PZOtr1I0xqJhltrO5Qw/5e1Ja+/3OlE+4ooa9VL
         acGxHxK0YnNfZQ3D0fDCwrndAQWJUs+v2BYw+Wmmy8zkIqN7WOSXAy5HFPzyY/7AQtR3
         DJ62ifxBL4n2xJpr8yvoVzNRwAnzTfdh1K1CGEoMLovkViDfUstdOvcf/6YmZDAak2LL
         eiyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=F68X1wZZaRGmGzLVVWGsDmRPpkHPjy4MiUljuiD/iDI=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=jaxn2DtRXT8buiBflOAwv3d7/mTQz4vBkorbHIQevRH4NJKP2LEi5XTcyjIONLfFVA
         nB6mEKP6StPq0/gZzzCL4jJPNvVTD+BHJbN+D9yRTC8C+AWFEVvnl30LJlM5bIDf33U0
         QNNpBtovjLskP54BLadYgDzcLYyropzdcuZu/A4zoDSUF+ULBQZ5VUyVpqlhXluETY5G
         F0NkgUZPhlpuraDmb9k0atyzVEPteqmjZQNhBmBb9DCbbQA9pa7soWjsZkAKTPzmNDEX
         I5bNNugRLDMVHeZ7p9Nx50cXoy6JsArWfHLPZce7ueC62g6xcnTI4Xo4TVfYe7vXdwMV
         PlzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id m1-20020a05620a24c100b00779d0155329si2522044qkn.702.2023.11.17.13.17.48
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:17:48 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-439-H0fc60lqNaSqYfCQl0vFew-1; Fri,
 17 Nov 2023 16:17:46 -0500
X-MC-Unique: H0fc60lqNaSqYfCQl0vFew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D0E21C06525
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:17:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 99E6C40C6EBC; Fri, 17 Nov 2023 21:17:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F020140C6EB9;
	Fri, 17 Nov 2023 21:17:43 +0000 (UTC)
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
Subject: [PATCH v2 29/51] netfs: Provide netfs_file_read_iter()
Date: Fri, 17 Nov 2023 21:15:21 +0000
Message-ID: <20231117211544.1740466-30-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
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
 fs/netfs/buffered_read.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/netfs.h    |  1 +
 2 files changed, 34 insertions(+)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 374707df6575..ab9f8e123245 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -564,3 +564,36 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
 	_leave(" = %d", ret);
 	return ret;
 }
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
+	return filemap_read(iocb, iter, 0);
+}
+EXPORT_SYMBOL(netfs_file_read_iter);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 80e48af8b72f..2ab989407dcb 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -385,6 +385,7 @@ struct netfs_cache_ops {
 
 /* High-level read API. */
 ssize_t netfs_unbuffered_read_iter(struct kiocb *iocb, struct iov_iter *iter);
+ssize_t netfs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter);
 
 /* High-level write API */
 ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


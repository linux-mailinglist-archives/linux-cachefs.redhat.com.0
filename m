Return-Path: <linux-cachefs+bncBDLIXLMFVAERBBF2S2YAMGQEPVU2Y5Y@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mail.lfdr.de (Postfix) with ESMTPS id B12F5890593
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:38:29 +0100 (CET)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4313931863asf12134241cf.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:38:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643908; cv=pass;
        d=google.com; s=arc-20160816;
        b=IEkdDmbEgySTl8aEIxavfXBHqh0jECg0AFQO6X2I9usASvW4uhJsFyIvny5a1lX5Kg
         du70luBClH91/f2WZkqBxoI7u3FdB5UbXtOLuNOuXHVFomnXGOPHy3OfI90J/mWtAuXX
         t7W5dcQTA8GpT5vrNtb0m6B6+pa5N/HoQJoYhcLxPV3HZM9YvmXpS+hyY62fvb2m9uF3
         T90OIFFFVsT3IGU5TvRapVfYLmX8091lMpM/+NFC2Xjz9ejam2vloHrXApKzcCi1RiaZ
         yMUzVBV+hA5tPDXsaRD70DeGII/A0yrgWyTQYxHcYokHUCcBNI6XoSYTwKjN/p0ff4/n
         rftw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=D33pZqT5fJ/B8xigz7GqbYVuR0pW7Ip3bLkqpoqBwdA=;
        fh=pl0D5BJahgOf8cFYbAlOUYg6ptrMryZpbhJ7NpQsb6M=;
        b=YhmHExnLGH6JB+ABw/RtUMdyHZFbn1ae9Qw3ZKRdLr8XNzZE/+O7OeOWej29//WE3Y
         ZXpjThTwqUvmkdxUhmDlv0hrjToyMA4oIu6YzPswHdda0agKVXngHqHCMBttJtBxIYMq
         nEAzOvTg3OR+zN/SR4GCiRmkRsCdIk6bWx04Mkw4v2wZkXg1qV4po6llIGn0QXaIgDCR
         9Ki4A3MXW5zN5RS9O/tbyrSR2ZHqQPh4f5qLtDPGoJTp3R9vXFVQBwKDc0GJBXWw2zzb
         Q9lPCL75gsxQjdnUO3n6m/K2Totdu1FcEB2VhliuJDhFJeeKWLQaVUGXzp074CktFUPF
         6/eA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643908; x=1712248708;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D33pZqT5fJ/B8xigz7GqbYVuR0pW7Ip3bLkqpoqBwdA=;
        b=XBmI9fEdjpNr64YSidBElmNYE0GYPs068XB5n+1yQoPAhx7SX6jaJBiDrVkzrH9BQq
         FqKUMP8et0DKHWMNOP8qMvulh5/YOTNCmy2hd5AvTWJaj8rio9JxGQ1kLMWK2GejLfUW
         qXypBm8V3TU79+VWwRSJgDBFDkE8KIfBQ+STbsMGsWaXp2wsc4dVs+42tr2OJEGq6e9k
         a0kSRq9H0paxT2TVHNmyTlqGSlSKu2egGpoR+Ac476I5fnz0zmCEVdQb7QVkIrK/pBva
         /iK2YwB0JXOOGlk1qnJd+8TVNtmGo4/eYeKWVhLYe2yZSYRmGYeYdCOOu8CcoOgS3uZj
         9Uag==
X-Forwarded-Encrypted: i=2; AJvYcCUF8JlUWun/fV263kN2/tr23K1bYyxInWqreaZ8P0WKUTb4934qE+XH2eJXZJvlLChYcJvJmv8Hkx56YkVaHow1VQ0HHkRnE5ZPU60=
X-Gm-Message-State: AOJu0Yx1EzrC7+R1sk8MJPzZNRVLC2kZakj6IkHOeycQMuItn91SNuV3
	X4UHhWjYaEGHj9srb70vqX0nI323+zN/y24URnlh1vFNHas6GPHFM/U508PIz84=
X-Google-Smtp-Source: AGHT+IGvIWgr2Bd+WN8VzrtaMDzlqDAY3M/wGQkc4hiRqZcuDIlAouhPk8LwVECA1SJfVkEmXAvvbA==
X-Received: by 2002:a05:622a:1494:b0:431:82ee:52ce with SMTP id t20-20020a05622a149400b0043182ee52cemr2829044qtx.63.1711643908696;
        Thu, 28 Mar 2024 09:38:28 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:45c5:0:b0:432:b2f9:64f3 with SMTP id e5-20020ac845c5000000b00432b2f964f3ls960350qto.1.-pod-prod-01-us;
 Thu, 28 Mar 2024 09:38:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVrJ3lCKQCL5xS01QdBq2/Zrx9JZkAar4JiO1HLhUdOIl1sCKN3dd6aaxVDM6+hp272plA4YuhE2o3oIIDzpL4kSxOz8VoI45ML6TRJYe8=
X-Received: by 2002:a37:c44a:0:b0:78a:34a7:63b1 with SMTP id h10-20020a37c44a000000b0078a34a763b1mr3270271qkm.51.1711643908089;
        Thu, 28 Mar 2024 09:38:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643908; cv=none;
        d=google.com; s=arc-20160816;
        b=RH2NwTd2n3HM+MZ4bwpwgs/v2SeyUG0ZW6ngY7GfQwlOyUwnFhOP8XnsxpHjCfrKih
         rKz3JGHPZscu+U3CeBrLaTwDZPUL50NrBBKHg8qNs+zj/Wo2tW0QJc7mSfhfKpumUvtf
         MtSTTBfTWAT5mla/lP2czzX91n1eop9D7R0Kq+NDcG2yoQZB5N8r4FvR+0tc5VNqbgh8
         jUjsan1xV4t8wzfrOpc6HPSulPVo76fMfSVPsjMh4jyLoItWkyR+phrBadOjjWO6/c2T
         Fq0AxJ3Hu1vUCUcBt48zZ+1Qlt6WHSikAb2DvXLmlz5i3YSeAkzAQlMaZOT1OK/BYee3
         NzxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=PtpBbjrD+Slaag5TH6kef/+TLI8uFihL8QWdtpo1kX0=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=uYfvuo5mXBpKc+XzJTBF/0x14JPMJkhDZTRp1XtMrZo6MdQPxmAfvgESN9/Fmv6zTw
         rIlxYH45HuIiU7qfQed8isArVU5XHjRY7T0s3SXtOvY4TVAZKU9Nn3hRj3Nubulq9l8u
         Yj0gI5nlTw3mJK7YxIMRf+nsKSnuhrzAmpoVEqeBy1XaaWNdkC/KS3xXwBA60qcNQR32
         3nmleqN+qBQv1E5kplCkzjDcvt71tPn05ac4c6FafnrvJt47ah3OGmU8NnvRML1gfGSK
         vEyT9xGbuEt+LQXm/t0WJBye40ynpORG8Na0J9csXDst3b3wWVSndWIVqzPCuSapJxGb
         NwLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id h9-20020a05620a244900b0078a3b0567e5si2056418qkn.19.2024.03.28.09.38.27
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:38:28 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-VusW5bSoNESI4oJ0XZeAfw-1; Thu, 28 Mar 2024 12:38:24 -0400
X-MC-Unique: VusW5bSoNESI4oJ0XZeAfw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FF5388F2F1
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:38:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 1CD1F2166B31; Thu, 28 Mar 2024 16:38:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EED572166B35;
	Thu, 28 Mar 2024 16:38:20 +0000 (UTC)
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
Subject: [PATCH 20/26] netfs, afs: Implement helpers for new write code
Date: Thu, 28 Mar 2024 16:34:12 +0000
Message-ID: <20240328163424.2781320-21-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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

Implement the helpers for the new write code in afs.  There's now an
optional ->prepare_write() that allows the filesystem to set the parameters
for the next write, such as maximum size and maximum segment count, and an
->issue_write() that is called to initiate an (asynchronous) write
operation.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-afs@lists.infradead.org
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---
 fs/afs/file.c     |  3 +++
 fs/afs/internal.h |  3 +++
 fs/afs/write.c    | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index dfd8f60f5e1f..db9ebae84fa2 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -400,6 +400,9 @@ const struct netfs_request_ops afs_req_ops = {
 	.update_i_size		= afs_update_i_size,
 	.invalidate_cache	= afs_netfs_invalidate_cache,
 	.create_write_requests	= afs_create_write_requests,
+	.begin_writeback	= afs_begin_writeback,
+	.prepare_write		= afs_prepare_write,
+	.issue_write		= afs_issue_write,
 };
 
 static void afs_add_open_mmap(struct afs_vnode *vnode)
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index b93aa026daa4..dcf0ae0323d3 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1598,6 +1598,9 @@ extern int afs_check_volume_status(struct afs_volume *, struct afs_operation *);
 /*
  * write.c
  */
+void afs_prepare_write(struct netfs_io_subrequest *subreq);
+void afs_issue_write(struct netfs_io_subrequest *subreq);
+void afs_begin_writeback(struct netfs_io_request *wreq);
 extern int afs_writepages(struct address_space *, struct writeback_control *);
 extern int afs_fsync(struct file *, loff_t, loff_t, int);
 extern vm_fault_t afs_page_mkwrite(struct vm_fault *vmf);
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 1bc26466eb72..89b073881cac 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -194,6 +194,52 @@ void afs_create_write_requests(struct netfs_io_request *wreq, loff_t start, size
 		netfs_queue_write_request(subreq);
 }
 
+/*
+ * Writeback calls this when it finds a folio that needs uploading.  This isn't
+ * called if writeback only has copy-to-cache to deal with.
+ */
+void afs_begin_writeback(struct netfs_io_request *wreq)
+{
+	wreq->io_streams[0].avail = true;
+}
+
+/*
+ * Prepare a subrequest to write to the server.  This sets the max_len
+ * parameter.
+ */
+void afs_prepare_write(struct netfs_io_subrequest *subreq)
+{
+	//if (test_bit(NETFS_SREQ_RETRYING, &subreq->flags))
+	//	subreq->max_len = 512 * 1024;
+	//else
+	subreq->max_len = 256 * 1024 * 1024;
+}
+
+/*
+ * Issue a subrequest to write to the server.
+ */
+void afs_issue_write(struct netfs_io_subrequest *subreq)
+{
+	struct afs_vnode *vnode = AFS_FS_I(subreq->rreq->inode);
+	ssize_t ret;
+
+	_enter("%x[%x],%zx",
+	       subreq->rreq->debug_id, subreq->debug_index, subreq->io_iter.count);
+
+#if 0 // Error injection
+	if (subreq->debug_index == 3)
+		return netfs_write_subrequest_terminated(subreq, -ENOANO, false);
+
+	if (!test_bit(NETFS_SREQ_RETRYING, &subreq->flags)) {
+		set_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags);
+		return netfs_write_subrequest_terminated(subreq, -EAGAIN, false);
+	}
+#endif
+
+	ret = afs_store_data(vnode, &subreq->io_iter, subreq->start);
+	netfs_write_subrequest_terminated(subreq, ret < 0 ? ret : subreq->len, false);
+}
+
 /*
  * write some of the pending data back to the server
  */

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


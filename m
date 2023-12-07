Return-Path: <linux-cachefs+bncBDLIXLMFVAERB4XPZCVQMGQEX24WQNY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mail.lfdr.de (Postfix) with ESMTPS id C33CA809379
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:24:03 +0100 (CET)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6d9db462dbcsf1222969a34.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:24:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984242; cv=pass;
        d=google.com; s=arc-20160816;
        b=gKy0pRb9nRTwnI0N2N3dKvMvhvKYhWIefkTeIRy7/LpB3iawYdGnxqaNODmYSeFrya
         bw6yXdZpZu+QMWnsqoIG6tmQuR2cakxNhARnY67zkZszDtPMzk1DqIQiWdHTZ75Nz6L1
         lEsBKUfuqTcEnhKQZWGRPTY3yoz8bwwX8RrroX5w4LLAZ4SSN3uKAfrabCYOvEoyrlqL
         S5CZkS1CZPS4CnnJ1afWx2SWOwsOBjlEuj8UPj3+7KeRdERKwM7tcSiBInm00o1w2Y5M
         rbx3B5afL6oPHfRpRzYCgZj78XAq6HTn+P8iT/0NkRbhutPfS1II51iurhmPBufrvCf2
         daWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=7sXFpkD23kLN1FguBHrToqi10RStXhvJVnqm4QXUOvg=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=MOCsToblDz1LCqyRHxJyh9wdkFY9zr0X0i8CLaykcvs+K0UoSSQjMVzg1gsnQQ1vqh
         8dbfD6GaVMVfHHVvOyfrTQdcndjw/npPd/b34/TaNPZeXARgyoVLedlTkEng524EYTfg
         B9FdSl1GIGUwqpBpdJKyClmz09BSSOAP9MXMTyTsb2n2+0ddJlFoktB2C/Wg3L97OHMJ
         9u042ob4B+n30u2aTbUFUxqj5MSNOy/2e2+eF3J3T5nLgiNuuGbRXksGOxOMpkbge6ng
         NaRGwKQbbA2ceMzLkG3CwFJITUe4H/6NzNSaYurMqs+IHNQjiEqfNq+fORAn3sHe22Li
         I5ng==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984242; x=1702589042;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sXFpkD23kLN1FguBHrToqi10RStXhvJVnqm4QXUOvg=;
        b=XP9YgMYUX7xZre/wAh4hC6WjxBeeLhJTzeR0QPGa2IBpcjvP9W9ZjMXRo9QcASha9M
         c8uq+LgKkf6KIYaFeArikPZ6KDl6xS4GdNgHrcOhO30LkQ6ho5aVrXrQbdHzoMirsrdN
         sHAxz4ZPpK9WggrP9JQbeCFX4Qb+cJvJBXVW2eJf30Mw+E9E70JpNq/wjf0q7qU6CClg
         PYMYH/Gp9Vt1bEBFlRu/n4q2jJ4VXZPfOLtUWUvMi2fMMKDCjFvZySjNW9IVssibzQ/0
         8kqX4hxpuivtAvpZKxRB3RmKLYOuTsW7DSW9LD7m31mcs7S2IebbIT666L4cES0Aw7IW
         lJfw==
X-Gm-Message-State: AOJu0YwY6irSyc522CM0qgL3PMxWyenamI6+Ip2fllofVOyjVDLTPYPc
	06L8VYkAVdRkOcYLO0725FUjkw==
X-Google-Smtp-Source: AGHT+IEuZyE9ks7dQo6xZbESJqOhGEpu5Oj6IrgFxxiJ2waskCG7yw2VMDZv3TTyJhrUZ0XroHHTlQ==
X-Received: by 2002:a05:6830:6991:b0:6d8:7993:da75 with SMTP id cy17-20020a056830699100b006d87993da75mr3320677otb.13.1701984242607;
        Thu, 07 Dec 2023 13:24:02 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1751:b0:425:88a9:d1e2 with SMTP id
 l17-20020a05622a175100b0042588a9d1e2ls1624844qtk.0.-pod-prod-06-us; Thu, 07
 Dec 2023 13:24:00 -0800 (PST)
X-Received: by 2002:ac8:5916:0:b0:425:4043:5f3c with SMTP id 22-20020ac85916000000b0042540435f3cmr4152304qty.122.1701984240596;
        Thu, 07 Dec 2023 13:24:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984240; cv=none;
        d=google.com; s=arc-20160816;
        b=mIG74GwzgGY2NkOXkvVZYUx5ieahGhtM9Y4eJ+1OCW4We2FcxkjSAewyd1PM/Oisxd
         POOtRCxmlcPXORJ+QXcyXSyqL2lnLER5eQfoJSe7yCDwuqXRSgI995E7iE25Uo10nYjx
         NdxYu6zr9ZBXZm50L4FmzYrKkDrsK0voRE6Pv7diBuKxnjmHCQpuQLKHpqVHNTSs3hc2
         Nx58w11RecToVfmEDAnbBK2xGYd5wJ7QSRN06MXJgj/D/umW/2U+UARHV2f5EauVZAIN
         lWUWxN5WZB7hkqqR4xk/5f6UluKxsqn2KXjpXARWzVC4TzhElhl46xEwzHwDyCbUBzNR
         STwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=YcUt6Wlq9qFzNGrM+VViKKkJSoOctikTKew3FuWO+5w=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=WV/HbL94bzyKOZMI5o0th2zBSyzb4uufV88n+oSZHBIPGDDuDW638zGxyNNCiu0Qy+
         cyWV2npf9bqwclJtbliExR2FpgjN5xPPJRMS4orcBRaq1qaytkIC15L/WsAAmsBQyeCK
         hBo+k5kB0BbEb+TBgMx/IbHadKAfJl0NyHcgSJWQmBkptSp2HXOiCy35FSGqFlIOubQo
         mOKSLM7cbezaBFYuW6TQ2LWVP+58CFsiqPaB6DIroZ++NIxxFu0K8pb/z7cnEOhVz4at
         8zNNeW41NYukBpVluTxHL+fwxCSQt9zVrhkYE+RJFGUgQ2i+o+6mjcMAj+tJE/0LVzqA
         gh6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id l16-20020ac84a90000000b00423847441e9si631855qtq.60.2023.12.07.13.24.00
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:24:00 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-022OYqIvPsm5z3HQ6RRLdA-1; Thu, 07 Dec 2023 16:23:59 -0500
X-MC-Unique: 022OYqIvPsm5z3HQ6RRLdA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C425788CDCA
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:23:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id C140C492C29; Thu,  7 Dec 2023 21:23:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2968C492BE6;
	Thu,  7 Dec 2023 21:23:56 +0000 (UTC)
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
Subject: [PATCH v3 31/59] netfs: Allow buffered shared-writeable mmap through netfs_page_mkwrite()
Date: Thu,  7 Dec 2023 21:21:38 +0000
Message-ID: <20231207212206.1379128-32-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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

Provide an entry point to delegate a filesystem's ->page_mkwrite() to.
This checks for conflicting writes, then attached any netfs-specific group
marking (e.g. ceph snap) to the page to be considered dirty.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_write.c | 59 +++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h     |  4 +++
 2 files changed, 63 insertions(+)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index f244123ab568..70cb8e98d068 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -416,3 +416,62 @@ ssize_t netfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	return ret;
 }
 EXPORT_SYMBOL(netfs_file_write_iter);
+
+/*
+ * Notification that a previously read-only page is about to become writable.
+ * Note that the caller indicates a single page of a multipage folio.
+ */
+vm_fault_t netfs_page_mkwrite(struct vm_fault *vmf, struct netfs_group *netfs_group)
+{
+	struct folio *folio = page_folio(vmf->page);
+	struct file *file = vmf->vma->vm_file;
+	struct inode *inode = file_inode(file);
+	vm_fault_t ret = VM_FAULT_RETRY;
+	int err;
+
+	_enter("%lx", folio->index);
+
+	sb_start_pagefault(inode->i_sb);
+
+	if (folio_wait_writeback_killable(folio))
+		goto out;
+
+	if (folio_lock_killable(folio) < 0)
+		goto out;
+
+	/* Can we see a streaming write here? */
+	if (WARN_ON(!folio_test_uptodate(folio))) {
+		ret = VM_FAULT_SIGBUS | VM_FAULT_LOCKED;
+		goto out;
+	}
+
+	if (netfs_folio_group(folio) != netfs_group) {
+		folio_unlock(folio);
+		err = filemap_fdatawait_range(inode->i_mapping,
+					      folio_pos(folio),
+					      folio_pos(folio) + folio_size(folio));
+		switch (err) {
+		case 0:
+			ret = VM_FAULT_RETRY;
+			goto out;
+		case -ENOMEM:
+			ret = VM_FAULT_OOM;
+			goto out;
+		default:
+			ret = VM_FAULT_SIGBUS;
+			goto out;
+		}
+	}
+
+	if (folio_test_dirty(folio))
+		trace_netfs_folio(folio, netfs_folio_trace_mkwrite_plus);
+	else
+		trace_netfs_folio(folio, netfs_folio_trace_mkwrite);
+	netfs_set_group(folio, netfs_group);
+	file_update_time(file);
+	ret = VM_FAULT_LOCKED;
+out:
+	sb_end_pagefault(inode->i_sb);
+	return ret;
+}
+EXPORT_SYMBOL(netfs_page_mkwrite);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 702b864a4993..46c0a6b45bb8 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -403,6 +403,10 @@ void netfs_clear_inode_writeback(struct inode *inode, const void *aux);
 void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 bool netfs_release_folio(struct folio *folio, gfp_t gfp);
 
+/* VMA operations API. */
+vm_fault_t netfs_page_mkwrite(struct vm_fault *vmf, struct netfs_group *netfs_group);
+
+/* (Sub)request management API. */
 void netfs_subreq_terminated(struct netfs_io_subrequest *, ssize_t, bool);
 void netfs_get_subrequest(struct netfs_io_subrequest *subreq,
 			  enum netfs_sreq_ref_trace what);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


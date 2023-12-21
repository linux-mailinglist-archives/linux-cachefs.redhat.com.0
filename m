Return-Path: <linux-cachefs+bncBDLIXLMFVAERB3XZSCWAMGQEI5MT3RQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCAF81B77B
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:26:07 +0100 (CET)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-425d5915c69sf12355881cf.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:26:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165166; cv=pass;
        d=google.com; s=arc-20160816;
        b=AuMa8kzdyDZHhCjfJRNpHuoAZqy90AU18mulM2OSY3WwLs80ebn1Q8TCS/tyjWuwrq
         ezri5WomhfLXcQVMZ3hm9OqvJ+NV7RKM6TD8NgUQZlHOKU6LEt9CsijeejDL7aSg8zNT
         h3rLLDw+okKm1vPEzZyXkUJMR8OwYe9uVuOdSx4jbRSbHQtOnwJAgUbQlSD84mG414rH
         zxbRTsCg+JDkNaIFOC3l7SzeNRq39HUdNgQU90wpnvkyRJcNYQpbkrDZREBnp5Z0pjR5
         KOE20T7Ci/iZ2F36B0U7yGsAjFvr6upFIHwvbk4rXTFTtHW706XSTEVKKeptC5g2pHiL
         FhJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=G5+q/rQzzpGFdGYoUNcw9bYYqwNxTt4BmSdh0NKEW/Y=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=PZ3E5ybpqsMk629CMD7Nj0toPQZwsN/PfHR4Basra3hEXgP84vbdl7Fe3VjoJlJUiI
         4dVGajCmS0m/DGCO38AxNdWaol0+jpcVzJnF5AbQCoYygo2AGY6wflrVy2N4T/RrDhIZ
         yynfpIbIVhUAuwtzt94nqUyEIAuYFY1Ug9/dZTfxD+1OBLLjQqVM9Oedp4heUDUnLqaK
         oP3YRoOJ0/c0oC0WSMWFjOvpNhyxbXtexEZIoxDDdY+oY91pOiafU1oXEO/rRdZxRznh
         hm9vA7iS+hB4uJ/5GDgKO/Z6fKhlEWRtsWI0K80iRwZAcfVK8OttH+ZJ/yW9DAMBYHuk
         v66g==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165166; x=1703769966;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5+q/rQzzpGFdGYoUNcw9bYYqwNxTt4BmSdh0NKEW/Y=;
        b=mbZmmYSWozffB4wc59LuGXgnLxDyldo3wQL9cGOH5B1tmZ2M+jpoVxn7xxsswdelY6
         kjogJyl5Nku0eAUgzVIVZgiexFayeaAzCSjqhBOy8Aq6m8LeBjOzAFH68xpeWnQB3/EL
         2PWpKp0fVSX6mYfZskPOPu9Nl58vDztJe3m/4rRW+IV7PKp/Y2CQJuIqfp7k2xtEGy6U
         FdsZ8YkEeK6MHwzSJXB8Yu8yq8SLpU8U6BJaAB27PJx4a2rM5rc9snfjjwXM2mCYqofS
         etYG6f1vrYHOBRfTqHItGIoSIyriv0QP+WwVJ/6o5mipmBJM8LXL3HcSVHX1Fg72bkZi
         LOBA==
X-Gm-Message-State: AOJu0YwBlQ1wgIFhFYMSAzvNLUco0ah2b2cYtwgsZlGoeZUltzifWxmu
	1gT+ebGYVwd3TTvf3h+R6CJMGA==
X-Google-Smtp-Source: AGHT+IG0OEu59VBJnLdxNfqpvczvs9ZI2mrGtaBxYe8m3icXc75WYhDMUTt0pNhl8P+GkBcqxIuv/A==
X-Received: by 2002:ac8:5a8e:0:b0:427:a101:5331 with SMTP id c14-20020ac85a8e000000b00427a1015331mr642964qtc.40.1703165166278;
        Thu, 21 Dec 2023 05:26:06 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1811:b0:427:9ac7:4744 with SMTP id
 t17-20020a05622a181100b004279ac74744ls1024920qtc.0.-pod-prod-09-us; Thu, 21
 Dec 2023 05:26:05 -0800 (PST)
X-Received: by 2002:ae9:f714:0:b0:781:20e0:f338 with SMTP id s20-20020ae9f714000000b0078120e0f338mr657918qkg.51.1703165165749;
        Thu, 21 Dec 2023 05:26:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165165; cv=none;
        d=google.com; s=arc-20160816;
        b=amTR5F0S6RvjcZtT3JmTddvoRRyPoOxtJhnlHGw2c0DzXd859JeVfbYQAGOg6qteue
         qpej07dupx9QLadvSjYhg1lztsEDHqfqYytwupunK533N7wwrvsocLGE61Ymu3ywaUU4
         EQghLXOJmpjARKcsCjB/6FHorUc3m3OSxbGkDehx60OztWyFK4j7yG+1FYB0ObfTU0qt
         P68f6koa3QLhBhY1yj/Dwxf2TPWavbHgA3vZrdfroEtpLO5WF4VgxWuOyLzKFApjScEB
         6dqyCJtFiUawMqbWH6eBHCIOk90IJXpdw7kwNgFAgM7+ouofME4HjUQOD9cVBrqrJ7wM
         lSSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Lo7aiJvCCD3HpSl6jVNRfFvoImcPzv/sQTt6KTq//FQ=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=KZduirIlxiBYy9UNrhbgO4KrovHbklB6NKOBAxP430CnR5Sn0BrlPrXKgOy2PFlH/p
         VintP8YCYyYmTUQy5uHkeEQjiFYcrJR+4/IwHkjJ4DVFx3vSPwo16L2O1NXKN+K/zKRx
         paiwRART0BGbBT9MlpynLvqnBq78CcMJbNjcAaO9ekEzsSyir53Y9WWhWkgK5VT2Sx7S
         jdVSgaPL3COxivmMC54DtkR0EBUZVYcUiOHQOY8c+FDs/7PqJyMhStiEIkQBi010JUmg
         9DYeVw0BFanrjzya/gqNyBNCM8E2zMlly5DmKzsWHFj1opBERgWbZTSaKTljUB5YsZDb
         v9yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id bl32-20020a05620a1aa000b0077d75093ef3si2286304qkb.606.2023.12.21.05.26.05
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:26:05 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-yflta1n_Pm-GVh207dp6Aw-1; Thu, 21 Dec 2023 08:26:04 -0500
X-MC-Unique: yflta1n_Pm-GVh207dp6Aw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4F0A868A00
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:26:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id D16592166B33; Thu, 21 Dec 2023 13:26:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1C452166B31;
	Thu, 21 Dec 2023 13:26:00 +0000 (UTC)
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
Subject: [PATCH v5 31/40] netfs: Allow buffered shared-writeable mmap through netfs_page_mkwrite()
Date: Thu, 21 Dec 2023 13:23:26 +0000
Message-ID: <20231221132400.1601991-32-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
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

Provide an entry point to delegate a filesystem's ->page_mkwrite() to.
This checks for conflicting writes, then attached any netfs-specific group
marking (e.g. ceph snap) to the page to be considered dirty.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
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
index 5c225f308704..e444f814dd56 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -401,6 +401,10 @@ void netfs_clear_inode_writeback(struct inode *inode, const void *aux);
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


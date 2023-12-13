Return-Path: <linux-cachefs+bncBDLIXLMFVAERBFU246VQMGQEPY2LR3Q@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mail.lfdr.de (Postfix) with ESMTPS id EF14C81166E
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:26:15 +0100 (CET)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3b9f55676a1sf7786081b6e.1
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:26:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481175; cv=pass;
        d=google.com; s=arc-20160816;
        b=SH5K99rNh6SblJCiCDy9VUdalNyhBL3Ck3jEvDP2esPzGJVeV2EBsPymBT3fKv6WT8
         ZCQxrw8OUjR4/6yAyKfGgg4LUwOpft7oIAPmixz9bV4zMA5r0lV8kI+AayYgDNwRbVv5
         Nlvo7ZpG0etc0aVbduw62yWnLYTew64AVRe135ABOQBmSObIiTlTdRW1bunFfnyzzDYC
         KWAnYCC4FMYgAIxKv6ZPwBu9XLPgGB7Gdz00ThzLppRZhlyHcRNSNcqmdGZAcqEcJmNm
         frX0oW+iHxdSGzrPVw04vTj/jFk9B7b3cQhVw8i4bh/Vq3c7VWdSdFPwilSyBRoFK4D8
         7z5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=7sXFpkD23kLN1FguBHrToqi10RStXhvJVnqm4QXUOvg=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=oYkc9TmSYU3uIa7oh3w8CV23ynC4y6OiKDgEPKBTRY1GN6PXCapHYKHUxmTJ946MjA
         5UJx7wg4HtsLVjl+Izpp24l/3WOStXx0D9WuTxpr5qfkVPIPvU5PU+LrVsN0WgiQjs4C
         77tAU8Cs+YpMUm0VzwyXmBs5UtNZcrj0qOJUR9h0YJFoDCAZxvneiOs3wGGcqw3a64Te
         XliuY0DKo+Xr7R1MYbvrsWFhEzqRqQhTNpNn5rfIUcrzMI1fupfCzEq8+N+NZSxsEMHB
         dwdsyORnm3FN+H6t/3etsnN7hLIkXUkyxxxzrYEqP9AsHFVaGTlLi3wMCdThYf2WM/tg
         EKzw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481175; x=1703085975;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sXFpkD23kLN1FguBHrToqi10RStXhvJVnqm4QXUOvg=;
        b=v+UQO5/b2Fcc0Sw2SvNyqDoHEwfevs2Zi7iG+kEQoVGxJUSmTJGQfN4QhrVbtwXcdB
         0wTTODWty7AQqyS064UtpQoPocRjH6EpUWKCeG67lo7IJdOC7vigGqll/qPXNH2Vrz7v
         0F3nPzJiWkg7h+3h2/NXobGubDungEVdG+h7Dpjq8irLEjasYHb/Of1XhBBoasDiLoET
         aGq9DSzln8RzofmAWE4xv4nJ4gFA+rUCmiAkH5psPOO9AmwVYW4gHh/7FWH582jr4S/L
         WNI7BBD7UAHxdxJmEQgDG33TZFlgw8isB4y5WQYMMnwy02n+UP0+iO11N5PjgdTzWRlp
         0X+Q==
X-Gm-Message-State: AOJu0YykQcql76UzhFz+vI7HARodpibyoSrwkh30HoA2i8nkjeNFTwBM
	761giDtSHMy5tLWpIKZrf8ZWuw==
X-Google-Smtp-Source: AGHT+IF6E+Rn0AuCGEN6XRswQLIR8zkBzP/zfTQwUcQ9vqrsS4UwfEkhzfG4LhbDgKnenO0tQFE96w==
X-Received: by 2002:a05:6808:4486:b0:3b8:b063:9b76 with SMTP id eq6-20020a056808448600b003b8b0639b76mr11744381oib.104.1702481174880;
        Wed, 13 Dec 2023 07:26:14 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:651:b0:41c:d096:577c with SMTP id
 a17-20020a05622a065100b0041cd096577cls352505qtb.2.-pod-prod-07-us; Wed, 13
 Dec 2023 07:26:14 -0800 (PST)
X-Received: by 2002:ac8:7d03:0:b0:425:4043:762a with SMTP id g3-20020ac87d03000000b004254043762amr12709793qtb.82.1702481174358;
        Wed, 13 Dec 2023 07:26:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481174; cv=none;
        d=google.com; s=arc-20160816;
        b=JfI3t+fDK/aTL0wLssLZq7j+90xKPVstTKPd03+JMmx9zCrUjrqu+0uLb9xJLP7jPJ
         s8zSvSxngsf2LRcCOF6DbJb2xUI+yTpwWoThRdrHBlPZHye385ornYOFhBUaVge7pq66
         NAuwR2uNaDd3HltCXc4yXW5Koxr28ysF5uMkPdwz8S4NZrCI2tH/EPfWKMWhDweEmx7p
         U7aN2MWtA+TwLiqDZzScuRcWEbFzQJAYuH/2IXoJFu9flWrA18bv5cNlho8QPhqtO9Jj
         +BMw0ZDkrHa3+Wc6OEd+ONFQaPLF8wx/E93PVUq9lv1EMz5NzOmiXDuiOv0nQ5p5HQfx
         851g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=YcUt6Wlq9qFzNGrM+VViKKkJSoOctikTKew3FuWO+5w=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=To4Rn749CekhlKYRtnW4DhQ1ugGor+Q1vDXStNTa6z4Dhb3dgGdG9ngDRdHC6a5hkX
         TqiO/O/3/BunAXN3hlKYs9liHbC0OJvjaupusHifRalJeM3MWyARvVtmm3sHbaEWiN09
         DK0kNwLTUTXFtcFf1LLHgHnjECPT+WlFHWf7ETL32pKpV/3Q8QdjII9m5W4BYZE90XTS
         oV1IGfSkmZ74OCotgjfUClVuNGfRVArajBykYU4RHnkINTMfLX+8Q1SHHDPEJgEzBxDm
         ADz5N/EFVartOh1bm/J9/KnwvCyjJ0SHntEZiKcacvmb2Y1vnQyFCdkMBwFp2eWEoHQA
         7mtw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id d8-20020ac86688000000b00425868d0d56si12821420qtp.28.2023.12.13.07.26.14
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:26:14 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-67-edYzUlHwPv2KRU956A80vw-1; Wed,
 13 Dec 2023 10:26:12 -0500
X-MC-Unique: edYzUlHwPv2KRU956A80vw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2E3629AB408
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:26:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id CF07040C6EBA; Wed, 13 Dec 2023 15:26:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2EE7F40C6EB9;
	Wed, 13 Dec 2023 15:26:08 +0000 (UTC)
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
Subject: [PATCH v4 31/39] netfs: Allow buffered shared-writeable mmap through netfs_page_mkwrite()
Date: Wed, 13 Dec 2023 15:23:41 +0000
Message-ID: <20231213152350.431591-32-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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


Return-Path: <linux-cachefs+bncBDLIXLMFVAERBH5ZS2YAMGQELKFUWTY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0B7890568
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:36:48 +0100 (CET)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6e69a59f31asf1270069a34.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:36:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643807; cv=pass;
        d=google.com; s=arc-20160816;
        b=qxi8XJg77nKTiVgtoRUzWpOlOFmyxl6/xsbbEQGgVysDXKouWqyC8BvwokElh2oAa2
         q8fz2ITEQtL6B7RBtJ+a/8n7HhkaqtUL1ZopD8u4bvK0P/nen6dPh2vuObfDJp3pHLqZ
         n1tah1k8wI+qvaNnQZ/yACL7DgLMxP36W02TW5QIDxjQFgib2rFCcJUZtKCFcOCjzc3Z
         /gvUbDde0Cr8+lZCo1+bVJI5jRB7pLjBt3ryskIsuLQYICsFxBPADo7/nHZQrE2HusoA
         +uNwbSsWDC8lRgFVZhg0uPJwjfBU5WfXOaoZeOoF4tiBZu2e3el7zapRhmMAA1y3HOni
         32Zw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=cvDi61saHKNIrGrkQYfpNhHbK2kkwxzmU4S27WmegLQ=;
        fh=jJR3NzYUGt6X3RNcboMLDQBQ+HypxHm5spc/1dthWrA=;
        b=Z3lpypUptdG7hfLltxuSjEnc9GIR+7W8ypobOllrebWoKFppDyYyU6xpOcLjd5Jp/2
         EEghf6d10lTPjvMZ7lnhKhZmDJwEqpWXUPxLxwNVMtQezQ9tHJWIRKtibdqBNa0fyI1V
         YqyMaig59b+RGRM3jQHs1dK8pF4VuePQLyRphx4rpMWlTfAJXeAFbtW+SzdLzIHGqU4D
         jOsCQBoxAoz0twQVhTgaGrfclBatR2AHZHk+usq5DaaxxmfQ+3LPaJVAId0vi1hqS35W
         VOr0xppS3YB2blR4VctGtfIO0WrcNy98vOBH9ztOIVSlaw7xHYDCgmnY69fVnEM495HN
         mGHg==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643807; x=1712248607;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvDi61saHKNIrGrkQYfpNhHbK2kkwxzmU4S27WmegLQ=;
        b=TMVdShn5jr/It4b04Qwj8stE7TNmNGkOkbzIobCgubxZk5CsOOcSkc8r8vBjcgtznF
         /UPtVzRYyl0g5XTNMsHZtBzj2EKA8t2Fv0YVuiV+VV9KDz+wPu/T+YXImFreaTcj9Qd8
         pdJCFdkMUjPQqXAMNaeX2pmlMTggj0Jv1h0RFCQhTcGp4aQtYQdHaM9arFWGtE0OU/3y
         7G6fceZkBCSe2KrhTm9H4vger3J2DjGVYMRgwq34D33z5+8w3U+Z50Ky5jo4wbKPTsil
         HxclvwtIl15n1fFzRHnSa1jvRM9QJF3z56KW/XH5mbUCsML5g3HOg0o6WtS696UFqo0I
         DJ2Q==
X-Forwarded-Encrypted: i=2; AJvYcCVw+95tqwMeTIoOJVLockzY09VawuOG8LNb/dKcc1LDxaUigrr4KHdU5GRchJb/QDjPAIWU0xARxqAFsNtWut5setMES0n0V1rhSzU=
X-Gm-Message-State: AOJu0Yxm9NXNrjUE7BSkfJcXzQ1js4+S64f+Gqr9GeNG+3NDmiZiDwm1
	RvKl2hXUfqeYI/g59O07cmm+PTCke8jNC09ZTTM15FQz4sqNj3F/ysXPiJU7IZ0=
X-Google-Smtp-Source: AGHT+IFBV9x3nC1maDf73e1agGIkgefcmRG4e9hFvz5vr1Rp8Cgw0KXNxFC5qxX0UNgAmoa1w7YcAA==
X-Received: by 2002:a9d:74c6:0:b0:6e5:1dcf:7ced with SMTP id a6-20020a9d74c6000000b006e51dcf7cedmr3457715otl.11.1711643807361;
        Thu, 28 Mar 2024 09:36:47 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:5193:b0:696:8a5d:3e4d with SMTP id
 kl19-20020a056214519300b006968a5d3e4dls1358556qvb.1.-pod-prod-06-us; Thu, 28
 Mar 2024 09:36:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgpIno9LIOnAB4In/k2hod47FAXkLiUWKvJgGwJ0x23LnfCubPBNwp8Szywa85c1nQjCK1WSmV1sF7qtXzmjmSOJUjHe6ZsSzJ49duJcw=
X-Received: by 2002:a0c:c20e:0:b0:690:beb7:c6da with SMTP id l14-20020a0cc20e000000b00690beb7c6damr3276820qvh.38.1711643806626;
        Thu, 28 Mar 2024 09:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643806; cv=none;
        d=google.com; s=arc-20160816;
        b=kUwARwIcRnVUGDBeo37vbqilTjVbLz1yYGxttNRgTGfIUYXSkeEUoQmJ+U3Xy3skjH
         KKMd7LOnAhX7gEZN6vrEUUcmvDe3XEdsujF2yLZpWlPl/AEwQIBYB/fBYAL9adRHdm4y
         PgE2Ba/KeQm3ltj3IIldn2ygwn1ZHIYCnz8SZ7aLF8iwWdDcwfOg1VoPbw91p81zUAMp
         ccjdjhTgk46k9DTrJK7jIZqwLFMv3K3PnK2PkbkKxj3g2RxVn/JjZLOYobxQ114PEDt6
         tpc0plgmuw4wLqEwuAfLLLrqd4mm4P+9zoAP4JsM56Zo7su1T0XiFdlpdhRBbxExUvSN
         WdKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=lykrnbha/6S87zBZnY0wz/f7lqvJK6Se2csvQWUZWMQ=;
        fh=QCT0nYxQLXnJJ3ZUAkpm7r7CxvT/Ht1bCmFJUrbrHyQ=;
        b=D75FpvqvVMaLWMe8JvCxV4AgZ/dzQ1TDYrvGGjbO9QKyH5DJ6EoXAQTQxDqHDxO6Sl
         Yb5UvLkoO5gnMuby7UbhhkFBi84U7d1FNseS8ziYZrRmmrWj7X4kM/DLdONLCflqEC98
         ys4XghQgZGIe5Sx3M92QegfQVbF1kCwEDoZQLLFKYUeCAnssekBur0rrEW1nBdp6y5it
         xSKyPIi4zNuiZA7Y9rhAe69+0RM8fnyZ4td75OC+Mx680NEgabhieXzMujoFCsKkYnd3
         mwnrc2xAEA9AvTVoUsGBQeWhiYTIMwX4dbn1G09YU8QEDXjwIewQXQutcgzgvYMFYQd5
         Z49w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id j9-20020a0cc349000000b0069167009d17si1762828qvi.258.2024.03.28.09.36.46
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-385-k8I7a5bcPX-7HPiSGVPRmg-1; Thu,
 28 Mar 2024 12:36:44 -0400
X-MC-Unique: k8I7a5bcPX-7HPiSGVPRmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 702963806701
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:36:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 6C553C37A83; Thu, 28 Mar 2024 16:36:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2813C37A87;
	Thu, 28 Mar 2024 16:36:38 +0000 (UTC)
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
	linux-kernel@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Christoph Hellwig <hch@lst.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	devel@lists.orangefs.org
Subject: [PATCH 09/26] mm: Provide a means of invalidation without using launder_folio
Date: Thu, 28 Mar 2024 16:34:01 +0000
Message-ID: <20240328163424.2781320-10-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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

Implement a replacement for launder_folio.  The key feature of
invalidate_inode_pages2() is that it locks each folio individually, unmaps
it to prevent mmap'd accesses interfering and calls the ->launder_folio()
address_space op to flush it.  This has problems: firstly, each folio is
written individually as one or more small writes; secondly, adjacent folios
cannot be added so easily into the laundry; thirdly, it's yet another op to
implement.

Instead, use the invalidate lock to cause anyone wanting to add a folio to
the inode to wait, then unmap all the folios if we have mmaps, then,
conditionally, use ->writepages() to flush any dirty data back and then
discard all pages.

The invalidate lock prevents ->read_iter(), ->write_iter() and faulting
through mmap all from adding pages for the duration.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Matthew Wilcox <willy@infradead.org>
cc: Miklos Szeredi <miklos@szeredi.hu>
cc: Trond Myklebust <trond.myklebust@hammerspace.com>
cc: Christoph Hellwig <hch@lst.de>
cc: Andrew Morton <akpm@linux-foundation.org>
cc: Alexander Viro <viro@zeniv.linux.org.uk>
cc: Christian Brauner <brauner@kernel.org>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-mm@kvack.org
cc: linux-fsdevel@vger.kernel.org
cc: netfs@lists.linux.dev
cc: v9fs@lists.linux.dev
cc: linux-afs@lists.infradead.org
cc: ceph-devel@vger.kernel.org
cc: linux-cifs@vger.kernel.org
cc: linux-nfs@vger.kernel.org
cc: devel@lists.orangefs.org
---
 include/linux/pagemap.h |  1 +
 mm/filemap.c            | 46 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 2df35e65557d..4eb3d4177a53 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -40,6 +40,7 @@ int filemap_fdatawait_keep_errors(struct address_space *mapping);
 int filemap_fdatawait_range(struct address_space *, loff_t lstart, loff_t lend);
 int filemap_fdatawait_range_keep_errors(struct address_space *mapping,
 		loff_t start_byte, loff_t end_byte);
+int filemap_invalidate_inode(struct inode *inode, bool flush);
 
 static inline int filemap_fdatawait(struct address_space *mapping)
 {
diff --git a/mm/filemap.c b/mm/filemap.c
index 25983f0f96e3..087f685107a5 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -4134,6 +4134,52 @@ bool filemap_release_folio(struct folio *folio, gfp_t gfp)
 }
 EXPORT_SYMBOL(filemap_release_folio);
 
+/**
+ * filemap_invalidate_inode - Invalidate/forcibly write back an inode's pagecache
+ * @inode: The inode to flush
+ * @flush: Set to write back rather than simply invalidate.
+ *
+ * Invalidate all the folios on an inode, possibly writing them back first.
+ * Whilst the operation is undertaken, the invalidate lock is held to prevent
+ * new folios from being installed.
+ */
+int filemap_invalidate_inode(struct inode *inode, bool flush)
+{
+	struct address_space *mapping = inode->i_mapping;
+
+	if (!mapping || !mapping->nrpages)
+		goto out;
+
+	/* Prevent new folios from being added to the inode. */
+	filemap_invalidate_lock(mapping);
+
+	if (!mapping->nrpages)
+		goto unlock;
+
+	unmap_mapping_pages(mapping, 0, ULONG_MAX, false);
+
+	/* Write back the data if we're asked to. */
+	if (flush) {
+		struct writeback_control wbc = {
+			.sync_mode	= WB_SYNC_ALL,
+			.nr_to_write	= LONG_MAX,
+			.range_start	= 0,
+			.range_end	= LLONG_MAX,
+		};
+
+		filemap_fdatawrite_wbc(mapping, &wbc);
+	}
+
+	/* Wait for writeback to complete on all folios and discard. */
+	truncate_inode_pages_range(mapping, 0, LLONG_MAX);
+
+unlock:
+	filemap_invalidate_unlock(mapping);
+out:
+	return filemap_check_errors(mapping);
+}
+EXPORT_SYMBOL(filemap_invalidate_inode);
+
 #ifdef CONFIG_CACHESTAT_SYSCALL
 /**
  * filemap_cachestat() - compute the page cache statistics of a mapping

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


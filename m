Return-Path: <linux-cachefs+bncBDLIXLMFVAERBRHTYOYQMGQEXG4F2LY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 377CA8B77D7
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:01:42 +0200 (CEST)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-36c1b3aa28csf46503335ab.2
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:01:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714485701; cv=pass;
        d=google.com; s=arc-20160816;
        b=i7LawwUoNbmlAjJt/rSaOo9q/2GTfXs+dNPUIbar/VHYDTIwe6mUFaEwM163LrjE5m
         21EA0LGD6a4Stu7DQDABZ5PsQfSu+y3fuk0wUPPFs0O6DFkZ0foWEo9EMFHs1c3Z2QfZ
         LnwneTWFWXNpvsxb6ZQQv3x3+7WyIFEioOatmQ4Sg/C4i/Bdyjq9bBgH+PyleG+JKbj4
         AAypLhU0KqcuJoPvX6xmsPBAwrxZK/0HO9BByvXuEw8R3lmN0Kk0beQEw9XMbO3yRzlP
         n7WgiiZWcOko+cBblZMwCf8r+EJgowShV0MwZ8CWkKtJWg+rrouNiV0oMcO1URR2HIeg
         go6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=47+grVdgZ64ZYvdETB9bgjkVy+tumChqRcTml/PsylU=;
        fh=I6E7FKd4k7D8QQUzv3jisgu8LwvnjzPp0Rn+//5WP+M=;
        b=uKtRRaoG4drHhM92VVgqbLe77Rs+CXLnlP8LH6ffn6YwwmI7n7j37nlNkiHMSZZKTP
         wocoSnErDGRjnHdR5mI7qIqj0SZCgkXBUMaj5/uzrnJrI4O8eud4wkvcfVt3TN5PHBYe
         DVUsM+VDi5C/f15VQuiB9AFjYxGyfFkOhGUO7ed4N5V10T1ZnbEPIeWIsPm6d6jS6B0U
         eC4XKQhZLeTbM4hS/Oog0UyIL/czMernFyCIc4WW7oFi43ldTG7c+GPw9D86l5T7MRM4
         RxaTI2DfH00JO334lg5kRxWMBi97jyfS1YveoPj1UPA/iv/AGDZngZp8kQtmB3JU50hM
         MVzA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485701; x=1715090501;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47+grVdgZ64ZYvdETB9bgjkVy+tumChqRcTml/PsylU=;
        b=ojbS0gy/r+gzLpbEaG2P5Xb9bFkwz5DkmKcCTBBVP1WzetjVeMOYK5cEN9VXyuzJLD
         lQb07qCVt8W8uD1nLLo9yWAHRkEfm8RJ4+2nVCpZUyHcLJuMmpngZzTJd0/cw7ZynJX0
         ZNovx5NE1lcRiAnS2u5yMvzE8UMZctrg2BppuX2ntB35piJCPwkFcLoZV0erl9XADpJh
         Nc9Ey0I9Bm8CRPwjaItKpinujrGmuQXZqWAdITKuSVaHN+VB8b52lW4O4NTZQ4Zo6znd
         gdYGAvGEXv6cU/xcDv/BEUcEmdWSPq+7DATrt8mau+aEkKycJD2wp1ClWboRiP9q7kVq
         GoRw==
X-Forwarded-Encrypted: i=2; AJvYcCXij4ajZCIRF2bIXiDiWVkfH0o9o9PyRvi/v/ZlLiZYliTt2HPLoqFZIC6/WmQa8eh75u7zYaGS/9lKgVosaq8//VnGkZ2VtRhBcHY=
X-Gm-Message-State: AOJu0Yye+YBJLiwi1MckLWtYLVYgVWkGjDZhYeOKUFGggrJRMzONgHHe
	1VNhACOyyNwuJ0npAODR4jO1FtNx6iZq1+JMnXY2DsT9cPHDPNHjCvw5Uk3YNIs=
X-Google-Smtp-Source: AGHT+IG7ffut4ESAzfs1KjA8pn8l6QVe1p1XWkygJZTNJF2O+5RGhcVURj/U3D1u62JotAF0pJTwVQ==
X-Received: by 2002:a92:ca49:0:b0:36c:51f9:716a with SMTP id q9-20020a92ca49000000b0036c51f9716amr6786743ilo.13.1714485700862;
        Tue, 30 Apr 2024 07:01:40 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6e02:1581:b0:368:7cd7:c115 with SMTP id
 e9e14a558f8ab-36c29ee2b0els21981935ab.1.-pod-prod-07-us; Tue, 30 Apr 2024
 07:01:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV8lcPYouu1G0Tg6gH9vYdpCZgzeuo65Tvi1N1+BgKavviHmJpINJXQITNhoZSLU7eWZJJXCK2L35N1C9uWHUSgTmw28TrqjY1DolMJH2Y=
X-Received: by 2002:a05:6e02:1feb:b0:36c:8a0:c87f with SMTP id dt11-20020a056e021feb00b0036c08a0c87fmr16744329ilb.1.1714485699930;
        Tue, 30 Apr 2024 07:01:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485699; cv=none;
        d=google.com; s=arc-20160816;
        b=IWlJHpP626v60XOigqKyDlidPcxBt2xFisioEfp7dBFqA0pVzOz78po201KQQ4jrWw
         AcDJdhma6hgOddfj0Ya3W51DzqtsOa+uzrKz5QA3vg9/s10V8we60K9w6nE4x8KobV6B
         zoBq2wY5XkgouhSUUikD5nSK6HEgUUddrEIl6FxIIDiFD7YRKEKw5ValjKO2D1LxgwRG
         lRALg58PjyUzdyeq830CFuDRRPb08aKEDEiQbsOuTUtWo+J5JjNyC1oIoHXUiMzRzo57
         muYagYS1j4on/tt9R+xfzfd68avJEuehc8gz2rdKMZKKusL7rV7KAVReckZxl0kvwAdJ
         a9sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=83auCTKPJvOhAjo7iO96K59ucStUj2OSCQeoe5vc/FY=;
        fh=MRByWdGD0e7LCOwxmXv5cYQpukVa0xHJcjZh5lBl/ic=;
        b=TamoKFBW81g6mVeMzKh3hiabp/dmzGJo1qX7ZfmeUYVRpJvEANNQ99iGyTo+wwb+GC
         k/v8sHCj21LqPsKhGk3dsH7fj0/ArC45wIC0St2MQ4ISzooUw5HnpCKcXZfHXRH/Lr2a
         2sUp0dLOSOuUsYKhUYjoifqruDIYqw1wqLxZ/6BZoTbyI7tMUj1TE73jb+3I7kqTY4hc
         tERWGVUQPIKHHC2rplLbpnzs3104ytMpq85OFyLiVy1jYZHwStPT7UBS5uJZPkvZAY/v
         o+nAfxShNPOBvcU7hkkT0BQi5FdWz87Sxqf5J0Q7QbXm7HiRKq341QebAzzAQ9o241VU
         v37g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id z10-20020a056638240a00b00485186e4596si9994208jat.153.2024.04.30.07.01.39
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:01:39 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-375-LWq_D9YGPQ6jKt6iGuomsw-1; Tue,
 30 Apr 2024 10:01:37 -0400
X-MC-Unique: LWq_D9YGPQ6jKt6iGuomsw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E83901C4C39D
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:01:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id E56F1477F80; Tue, 30 Apr 2024 14:01:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 01FC340BAA2;
	Tue, 30 Apr 2024 14:01:32 +0000 (UTC)
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
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: [PATCH v2 08/22] 9p: Use alternative invalidation to using launder_folio
Date: Tue, 30 Apr 2024 15:00:39 +0100
Message-ID: <20240430140056.261997-9-dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-1-dhowells@redhat.com>
References: <20240430140056.261997-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
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

Use writepages-based flushing invalidation instead of
invalidate_inode_pages2() and ->launder_folio().  This will allow
->launder_folio() to be removed eventually.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Eric Van Hensbergen <ericvh@kernel.org>
cc: Latchesar Ionkov <lucho@ionkov.net>
cc: Dominique Martinet <asmadeus@codewreck.org>
cc: Christian Schoenebeck <linux_oss@crudebyte.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: v9fs@lists.linux.dev
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---
 fs/9p/vfs_addr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index 047855033d32..5a943c122d83 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -89,7 +89,6 @@ static int v9fs_init_request(struct netfs_io_request *rreq, struct file *file)
 	bool writing = (rreq->origin == NETFS_READ_FOR_WRITE ||
 			rreq->origin == NETFS_WRITEBACK ||
 			rreq->origin == NETFS_WRITETHROUGH ||
-			rreq->origin == NETFS_LAUNDER_WRITE ||
 			rreq->origin == NETFS_UNBUFFERED_WRITE ||
 			rreq->origin == NETFS_DIO_WRITE);
 
@@ -141,7 +140,6 @@ const struct address_space_operations v9fs_addr_operations = {
 	.dirty_folio		= netfs_dirty_folio,
 	.release_folio		= netfs_release_folio,
 	.invalidate_folio	= netfs_invalidate_folio,
-	.launder_folio		= netfs_launder_folio,
 	.direct_IO		= noop_direct_IO,
 	.writepages		= netfs_writepages,
 };

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


Return-Path: <linux-cachefs+bncBDLIXLMFVAERB2EE6C4AMGQEMRYLWGY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8EF9B0FF6
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Oct 2024 22:41:13 +0200 (CEST)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-6e9d6636498sf9595347b3.2
        for <lists+linux-cachefs@lfdr.de>; Fri, 25 Oct 2024 13:41:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1729888872; cv=pass;
        d=google.com; s=arc-20240605;
        b=hLilK80wTcBQNbQiCt/oq2JA8inym6xDBHd0HBBwcpqXnq+EnWZPNNSSpcEDpW206P
         080o8iSzswSZuoiQceRnuy0ium197mgCvivwe3d529057aSMuKzK1XNPs4T+pYj1PRk9
         OfHLxt6WiTpKy+QTRNDZDTZUqVC4BYG92nzM83TfLsNwHpEZBNO4R+GaOznrNJTmVrfb
         f8VfawozIo8hvr3gf6CQnZFqAsad0GlyGScAT830kb1uEs6kXyoVA+nFPnMJkSeFKWa9
         KGZTr0EWOKYzQxggdcAGrJYCJqlGRjxrWSxQyhRmdEYZsVQbpUAjUlPUP1x6gpJxZRBZ
         +g6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=dP6CCksileIVWueqsSKN8i+dF/NyfRL91dgyRRKNQAk=;
        fh=96cLElOhjSrYD9Y2hdqfgUVQ7jIdbm7v2syiv96PCbI=;
        b=AQDoSY2+ET3SM7CE3V2yb4JFQ+L/GJUiq1jXBjTjaVgN1fvDyFh/y+dI5Jwth4Vxkr
         2D0Pg6EQj5UFVULdpuhlg/q4VvOppdK/l5npaQT9ohVQdMkzcDvMWVrjxqmo2jiZVZRx
         IX+JJkbHP2HasLAn6zAJluZXlUDDprYd9agZacSN2+eQzOzLFE0ULdKv0W1cmIiP/trL
         pzz4K1WmanYC+ODpAZ/kbMz7YdUhmt4WjMsTGmtvQ/f5fCS0bbZ5F+3BBj57SCy/yrXw
         lJm4Et5Rx4OMYBmhJVX9/2eqd/RwM/J+KFLyP6U16SPGzVznu4Gy9BzOGOa6URU5U3G7
         cRow==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729888872; x=1730493672;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dP6CCksileIVWueqsSKN8i+dF/NyfRL91dgyRRKNQAk=;
        b=fGc0fj1cMFgCkn1tt7ZQcaiOHp+wzPSD5Sa8UfCGrYXDKbRjl8KeVt/3IG3vwcrI9u
         7GEFjF/fN/+MbGixeTtPJDreEBfrq3zLjhkKQH/NMKUHvf803h12Ppcmhr6uTOH1mHEN
         Jg0j0kqCNGqC7CSGCGH69qKYYxgPcF8g8wk90LWVSmUmpZEsCjOEVEwLx7M4ZSYBQhh+
         IFvS3/q5htrQpQ+nHq9jOevvGQpUZuc700K+/5z2HnlgPf/Jp4mWwq+A0qV3xXLzu5yz
         X4EDjUqvC0LR51w+CUIP8RYf6zNLN2b97Ne35XuVJXRoHNqeNSl/EFJSy9EfKLiQdHYB
         nfdg==
X-Forwarded-Encrypted: i=2; AJvYcCVZPhO+heJR+JFhm8nHGg3vtIQSFYyjjApW+c0i8uqHFBLjkJ9zw9e2mpjWga9Jx0s8wMXksg==@lfdr.de
X-Gm-Message-State: AOJu0YxUab6UKlMkuEyBsMiDNnvfLdHj6s2YKyv2hJFNSaIPpQO4qGIj
	sb0jcOeYv99NCrkeForX6zuTvtjGaXZhRJYTRZnLkBJ1z3/H4kF+PZdficITTbA=
X-Google-Smtp-Source: AGHT+IFU758KkjOkcMDq106UYMW+2DQhMcMzjeiLrFkKSr8ObMbR7he2a+wwk+VlWhhq5sO4h6t9MQ==
X-Received: by 2002:a05:6902:2e01:b0:e20:291e:7fe1 with SMTP id 3f1490d57ef6-e3087b84896mr910741276.25.1729888872478;
        Fri, 25 Oct 2024 13:41:12 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6902:18d5:b0:e22:6a94:f23d with SMTP id
 3f1490d57ef6-e2e4a7c5133ls2341311276.1.-pod-prod-03-us; Fri, 25 Oct 2024
 13:41:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjxm2YI0NtV3ZtiVZiCo/IJ8S/fJclZr6viwIo9zzG90SUZFiE4eC1Z8VjDEEY65o2ORtcBmyZDRbU/+g7@gapps.redhat.com
X-Received: by 2002:a05:6902:1004:b0:e2b:9967:6363 with SMTP id 3f1490d57ef6-e3087bfc625mr739144276.37.1729888871786;
        Fri, 25 Oct 2024 13:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729888871; cv=none;
        d=google.com; s=arc-20240605;
        b=Aq3RAHDW9gIwnn9HdkXtE5Hx0wxgSGvW4eljZFm64lf3KKjXJ4E4esULN6z4ACi4qr
         Yw7BYiTyc4MnH00Ib9T/8nP8cV6kc91vDYX3U4BNnAovL7Il5u4KZULe5mW1L5d/9bRk
         kq3lZ8ckk7EZ1KwNV0QlC8BEzguU8m1TKj49NUjGjPq6GrzbhhN9QT/gBSduyHMJxvwE
         e/bto37/pd2HYwb0C9L1LgaSgJ0gwAb817RJEnWG9YdTJuRLFwZlvrctq0PPsSWKrEJI
         jNplcke29GsAR9ILP7lj08JBet5Bac+n2luz8oWu1gE+1fr/2+aYchxKc8lU7/su2BwQ
         oneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=X3twVFG043O59vporSoGB49KW0yXOb7j0HiRw4sYWo4=;
        fh=S9oLL764npqAlTwfYdPhiOTkO7VjwvYShFF/IFwF3l8=;
        b=lhDpIMyks1hsNw+KnpPj0qGxYDSHj2TAFi4a2WTc4it3RogHrcmwkG9tJgQbTb6AXH
         4tcDNzGliY4EPaw5SJxCV7Bsxfu4UFA62u8QaBtn6sR6GjfA8OqHbtfhkhSu2A4DCLlO
         tM+oBkkb8ebGNPEfL/jJwd/3FPShd76ciE8U0hyEi9LKQunXrJhc/ZwKCW88QBYf49//
         e65zTPqdPzs/Mkq6XPd4WnfwC/723ff33l1w/mZJFH2Z4l1yHbnCzmKxnjXvzunTrLw1
         QucuVc5i8wlDzQUV6dDyjkqLoWXCq4JLP88ftSScPapaTZLv13ecOJiPskAY8ux7zIhO
         hTCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id d75a77b69052e-46132110f5bsi22079651cf.83.2024.10.25.13.41.11
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 13:41:11 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-17-8Gg9-_n-PbiI-nFW9hN7pQ-1; Fri,
 25 Oct 2024 16:41:10 -0400
X-MC-Unique: 8Gg9-_n-PbiI-nFW9hN7pQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9EEE21955D58
	for <linux-cachefs@gapps.redhat.com>; Fri, 25 Oct 2024 20:41:09 +0000 (UTC)
Received: by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix)
	id 9A30D1955F42; Fri, 25 Oct 2024 20:41:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.231])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 56A8A195607C;
	Fri, 25 Oct 2024 20:41:04 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Steve French <smfrench@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Cc: David Howells <dhowells@redhat.com>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
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
	linux-cachefs@redhat.com
Subject: [PATCH v2 07/31] netfs: Make netfs_advance_write() return size_t
Date: Fri, 25 Oct 2024 21:39:34 +0100
Message-ID: <20241025204008.4076565-8-dhowells@redhat.com>
In-Reply-To: <20241025204008.4076565-1-dhowells@redhat.com>
References: <20241025204008.4076565-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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

netfs_advance_write() calculates the amount of data it's attaching to a
stream with size_t, but then returns this as an int.  Switch the return
value to size_t for consistency.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/internal.h    | 6 +++---
 fs/netfs/write_issue.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index ccd9058acb61..6aa2a8d49b37 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -178,9 +178,9 @@ void netfs_reissue_write(struct netfs_io_stream *stream,
 			 struct iov_iter *source);
 void netfs_issue_write(struct netfs_io_request *wreq,
 		       struct netfs_io_stream *stream);
-int netfs_advance_write(struct netfs_io_request *wreq,
-			struct netfs_io_stream *stream,
-			loff_t start, size_t len, bool to_eof);
+size_t netfs_advance_write(struct netfs_io_request *wreq,
+			   struct netfs_io_stream *stream,
+			   loff_t start, size_t len, bool to_eof);
 struct netfs_io_request *netfs_begin_writethrough(struct kiocb *iocb, size_t len);
 int netfs_advance_writethrough(struct netfs_io_request *wreq, struct writeback_control *wbc,
 			       struct folio *folio, size_t copied, bool to_page_end,
diff --git a/fs/netfs/write_issue.c b/fs/netfs/write_issue.c
index 993cc6def38e..c186221b45c0 100644
--- a/fs/netfs/write_issue.c
+++ b/fs/netfs/write_issue.c
@@ -271,9 +271,9 @@ void netfs_issue_write(struct netfs_io_request *wreq,
  * we can avoid overrunning the credits obtained (cifs) and try to parallelise
  * content-crypto preparation with network writes.
  */
-int netfs_advance_write(struct netfs_io_request *wreq,
-			struct netfs_io_stream *stream,
-			loff_t start, size_t len, bool to_eof)
+size_t netfs_advance_write(struct netfs_io_request *wreq,
+			   struct netfs_io_stream *stream,
+			   loff_t start, size_t len, bool to_eof)
 {
 	struct netfs_io_subrequest *subreq = stream->construct;
 	size_t part;

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


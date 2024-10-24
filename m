Return-Path: <linux-cachefs+bncBDLIXLMFVAERB7VI5G4AMGQEDZIOBUA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mail.lfdr.de (Postfix) with ESMTPS id D638C9AE770
	for <lists+linux-cachefs@lfdr.de>; Thu, 24 Oct 2024 16:06:55 +0200 (CEST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ac8f684cdasf135147285a.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 24 Oct 2024 07:06:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1729778814; cv=pass;
        d=google.com; s=arc-20240605;
        b=SwHJ1u6QxCQdTrAIZs8maHJ2x28Z/FQZPyqE4mJZjynNvgvx9Lk1zurbQzpsij1dul
         unCbO3k2oBxXYXOl+3HxEYeuAapZLr2FCQNlZIpbyrgMSQ/EO6Ypva6z2Q7R1BlcB9hR
         8tm1wu54PlKOvRm9QnBvuXJ35MQxdEhRV1dmjxn8mEHB4EuXkmSW0/UOIjZea3SgIW5K
         bRLopB8q0PwUPbJQL/O4laJb05k8hlAgR9aEeXPwYOwJ0sCWh8kLfa8x2E8LSgbM7BYD
         QSVv19KvrkosB44CDG9hl9+1RFfINs6hq2oPeX+WHDwendKzhLLsRSQrVc63fjO4y9I8
         W83g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=dP6CCksileIVWueqsSKN8i+dF/NyfRL91dgyRRKNQAk=;
        fh=bY0ydhXb4UjsEXBxBbMZ4iiaC7TMhGj4kcTUTfk7/Bk=;
        b=I7R2drc/Ij8FLhFs/sVu303IcenGiHH9cHGk1jYdWhl2GFzDwi/gjBok4/ZRLl5sNA
         +k4UCRok0jVm5++pWW0P82CJ7aq+jT3fd4oE6/RofXsWNqla0T5YdeoSLCCUeTIzpmN9
         87D/5zm3WLnRYT46Alu/FnkznqBaMaJmyFKfHhpBGo8muXJvPBTSrxgNXRaYChb9fb0p
         jp/+4t8Mk+tRvkCBh3660rZbBZewd1ERkYIcAgJnR3QW6e8MueSUOHJHgscwq2S2mwUq
         1+KRj5W+2nHWI1htETkFmWcVTeYFR76DbBUp5yHWRTZ7P8W2l3KkYb8Hn0ggmC2zglZO
         PWVQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729778814; x=1730383614;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dP6CCksileIVWueqsSKN8i+dF/NyfRL91dgyRRKNQAk=;
        b=bVYo3SrAkehpMIhdFgvYmoSJL+MHenfZYokAjahValfgQE5jqA2edOb3eUyR7sFWjV
         /nB6ufyeMzhwRFhFkSwuN7y+78CtRHxe0gGjyFcdxuYYgMIBoD/UOLK1jPFHNS8uLfC9
         K2Lroc9WX2G5gb7QqEdsKKW8iw/lU4yLZFVmPKpsjye6c8YvUaHkFIJEF9VqodB05KVU
         vvHRIcdZwKtumehcen4q4cjC1+j8+FekNnW4y8E+aMG8hFhE3XWJv67+W1qMWC09M6yr
         bHp3Kur5zTdRkgCOpJvhe7NJub/odJZz+SOu7NH7rBh8YCikIooOSz5Q09xN0trY8Pgx
         3a8w==
X-Forwarded-Encrypted: i=2; AJvYcCXhcyDUCRW0iG8iG2P/qt5ZLGJxjKcwbvS9UoT6XLiVo/EFCdx2kapCgitXipzSw65y66sTpQ==@lfdr.de
X-Gm-Message-State: AOJu0Yz3Ty0X4xCJKWV2NJzFsfhkCVyKF2xoYO/zwFw+Uwn3j13eDGH9
	bR8Do+IcbTKABE1OS4Z4FAU0hmZBqlaaDIom8oernubtnfyoKbnzhlkN/P8gDCg=
X-Google-Smtp-Source: AGHT+IGA1JEZBsNYcx45tegNGHC6awM+b8+PmcxrofG8UkwSM7HRU85Dz78CCj0eHQrSGoYDxih4Uw==
X-Received: by 2002:a05:6214:5f0b:b0:6cb:f338:bf50 with SMTP id 6a1803df08f44-6ce3413a61amr83475356d6.6.1729778814487;
        Thu, 24 Oct 2024 07:06:54 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:cc6:b0:6c5:e73:a956 with SMTP id
 6a1803df08f44-6ce85fc3eedls16795706d6.1.-pod-prod-01-us; Thu, 24 Oct 2024
 07:06:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTKvkStjlaiJGTAQa4NQdiVDzbWXaDT1TReqoPlCji/Z+FjSA7QZeRof7O09+QXSC3dJAvRq2UbzJ5b7le@gapps.redhat.com
X-Received: by 2002:a05:6122:2a41:b0:50d:a577:dec0 with SMTP id 71dfb90a1353d-50fd020aabamr6987134e0c.5.1729778813469;
        Thu, 24 Oct 2024 07:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729778813; cv=none;
        d=google.com; s=arc-20240605;
        b=Om4c8tIWr7VaGS09AWhYKtMDK9WTQCmQOml/Elb1Vdr4w+HlOW7K8PGlX1vGgYUOm8
         34CXRI4/gaqHlLtkHuIqRuRJXCTehvfsWMw+ZFoInl7XjrCtRJFNVhrshH/rIE66RMA9
         8/KCz5v53ivwCtEXyq28GTogui3r3NT6hFiqgxAC6z8mdVPMp012qPKk+b4w8aEd9Aj3
         266Sn67VNBYPtoUMZFiGkA7NNgOUM8jyZELfHX2ciY2Ipt13K2MSSOY4r8BUl4jmGx9C
         7LEFLGWERqG0TkqwNp1PQeT1zyVHaPwAO0e50yiZovp1FeY4MHVL1kPwUEQF8xjyiQ/g
         Wt2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=X3twVFG043O59vporSoGB49KW0yXOb7j0HiRw4sYWo4=;
        fh=S9oLL764npqAlTwfYdPhiOTkO7VjwvYShFF/IFwF3l8=;
        b=fL+pYDWSf//UsdB8Gob4i0zM82Z5jSU1FT4qlhEHyR2Ldcx+693dyAPCVh1yHI2hpq
         PC8raKhEBi31NRhUxgBsq5h0wK4kQxZ8acBCP3snVQVhAJmdopdnYAjLyYf7OrUk5fQL
         0ypIDWwfinsN4LPppnVfKlZmI7cPp/ca/wjNGo6Gy8/QfrZMBfiLHQ3kVAr0JeWOOw/D
         dKi+FFY9QBy+YwpCEaNfXVwB85FpynAxx3SwfJKKsw4hv4+5P2CH8aT2ebgYLjJ2lBJZ
         2lzRiMqgiwU64O59PHWWr/inVAnhzhFJ8KGASgEgs03Z6Ti6p4WxkdhDjekIxI38ybAX
         63gg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id 71dfb90a1353d-50e19e20c87si2175741e0c.33.2024.10.24.07.06.53
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 07:06:53 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-533-dF_gQhTzPcODPNNVUKDVIw-1; Thu,
 24 Oct 2024 10:06:51 -0400
X-MC-Unique: dF_gQhTzPcODPNNVUKDVIw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0B1A7197702E
	for <linux-cachefs@gapps.redhat.com>; Thu, 24 Oct 2024 14:06:51 +0000 (UTC)
Received: by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix)
	id 05B06196BB7F; Thu, 24 Oct 2024 14:06:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.231])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B54DB196BB7D;
	Thu, 24 Oct 2024 14:06:44 +0000 (UTC)
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
Subject: [PATCH 07/27] netfs: Make netfs_advance_write() return size_t
Date: Thu, 24 Oct 2024 15:05:05 +0100
Message-ID: <20241024140539.3828093-8-dhowells@redhat.com>
In-Reply-To: <20241024140539.3828093-1-dhowells@redhat.com>
References: <20241024140539.3828093-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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


Return-Path: <linux-cachefs+bncBDLIXLMFVAERBLEZ46VQMGQE4GZHMWY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mail.lfdr.de (Postfix) with ESMTPS id A78FC81162E
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:24:29 +0100 (CET)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-67ab70c547fsf97034416d6.3
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:24:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481068; cv=pass;
        d=google.com; s=arc-20160816;
        b=nZk/fKlgY7h/hJucxjo1RlKRwWpoRJAJUneNKloz2F1EsZJn+GdXKndCtMvi5Nk3cH
         aSSM96jtCWUXtXS03n63FBej50pkf1AbKYUHtOEw3v8jneQxk99iVEoSN1Z7kQb1wgy0
         a/Dmy4o+FVCyTWcmOVzm8qssCe0Q9jOqqDUhNH6LCswWBcn9iu8PAi4jD6H1q/+TJMTQ
         YbLlk2QmX2cb9RQgMBFkeygP0YuPri3zLHd7JLpKGNY3ch/rD8Y9xv7ayrA3/4tjBU8/
         vr1QNIN9h3enJ1//ghGD/3qKi1ZZN3o7EWXXFhRrZn2glhxg3OiH9fvHeBeT8WU//ugw
         RWRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=PYmkrNKmY9z7JDjorgdL7qqhyafvaZghAFQGNW9pvn0=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=zFTWJnV3/AXhs+PzoaE6MB9UdhhQEMRVXwMQK50Q6gLMdcsLNUX5UIpaXhaufPV7ET
         JfQikcj/JWuDmccYXG1++ihUySbHs6ds1ld7vXF/KRhv9itF8/HBSuOfHREuphbm5AKX
         J5DXUZ/Jjke2mDIX5t8+LrLwm9PZTQ17zlEfj7M8MPxG1Z08BhS8xzgHRqOCaxxDYuFs
         aE4kJbct4X/PYXZPrdNNjayFmFeOPxexAsiOVsJxM0VV3l/P2ffNB7XGBDFJXBsOOdKp
         rAhwx6UT7l0N53Ew4MAfi1omL33QQ9MP5DWznXdiCWTt6yg1W1wltoNKyCH6uNuIGO9k
         EvyQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481068; x=1703085868;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYmkrNKmY9z7JDjorgdL7qqhyafvaZghAFQGNW9pvn0=;
        b=j5DC7+Jubs26zXtY6Tf1ipS1nWYlW/60V/p08MZ5Y8PvZ1STjEQGA3D9TUgbeVo8Po
         aJ7K3wVZgL4JGCXlVczEoDvKEVn1Yom9Exv/Rtf+PmfYyYXfa+xdRE1M4KC1nyraWnaR
         QbEZ7FpO4zNCG5DyeQIKwGh+UuG9zSzh5MgXqKJKWb8a8ywDPgNbz6FPJ7oi9oOVtCZY
         OvZPMrH4WSvxpRYMpselDdxLC6+BgFYT24bSnUEWR8VXKW0PILlbmXW6fPvpOQOeEIVd
         dROUA9LUu74rYSDsUvRm7pm+XLro1hv5KZcYgLRW0WEakD1GIwVIrZy6EikpturLoLWY
         oYcg==
X-Gm-Message-State: AOJu0Yw3plSSqDLLrkhDqBsY3QxAxy8Y0tZqY6Ia002tDijQ4y9QnGPn
	xTF0rRKsxlkelXvmYkSK+4544w==
X-Google-Smtp-Source: AGHT+IEJVHykhMD0SIddbABGUpURsQshSJsAQhjRTKh6xmGQpRrqHKmiWb1GojhiHnN7Z9HFx3X2Dw==
X-Received: by 2002:a0c:e70a:0:b0:67a:a721:e156 with SMTP id d10-20020a0ce70a000000b0067aa721e156mr9650086qvn.131.1702481068709;
        Wed, 13 Dec 2023 07:24:28 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:ee66:0:b0:67a:1a58:78fc with SMTP id n6-20020a0cee66000000b0067a1a5878fcls3120678qvs.1.-pod-prod-07-us;
 Wed, 13 Dec 2023 07:24:28 -0800 (PST)
X-Received: by 2002:a05:6214:57cc:b0:67f:54:da90 with SMTP id lw12-20020a05621457cc00b0067f0054da90mr533053qvb.14.1702481068049;
        Wed, 13 Dec 2023 07:24:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481068; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3l+Yveh03EEkefHbjm+TQEbi0tnojuJQ9XeUsxrQuOW+P50taTgUTnKuJ0CJgryHM
         Yd2LvjUiYa6AvXeZMUXaH0yiw06miS6bbPmHFnOTrPWGMHVv2gE6DPum0kGf3JsUseii
         X88t2QW4UzEe9W9iqg0cmqngwWvSJbOwi3d1xUOz3RqKOTWYKSFxWWYXsymXKi1H/m1h
         6QOPo/j8mZUEZ35qNCqEBwjVxW62MAdv9OiW9vIkSH+0eiOLzh8u+McxIEtoJenViCAR
         rJNuzJypI1At86S5xliqUPyoXoRcbHBmC3rvvvXB6hkGdoQeKqAOJCugCJ4XHGFmbVWb
         Y4Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=shWxGi+94hUVdbxc3FCgiKxDR0g1X33mrWTu84CcD7w=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=lFxDdz+JYWOyYVN1+HAO0EhB8xV1WowPgNspMHumszFSdlcn/SY2lrWZRKw9eEpJT9
         LfaiF5e5+m/OrtWY6FMlof51NtmfOkdyFOp+RrpCjRjKFU0gae8oLaoB2DDKAwD9kz9P
         fnPGW/XJDmUa8NmmLRccGe4WPs86XBCLaavys1blHT5ArciqvTaPPhFC8cCcYcS55aW+
         O3oScG/9P/KkuBeREwl7/FpU0ALOahMMbuhMQR9sijo1rt3IIeUPV/8os41ZkRVoJRCt
         5g4g7KalLzcg/Zejl99ZjTwilC5HckFsFimC5eHHSfTejAM2x42Jb8jXWu+N8ftIaQce
         zUpg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id o7-20020ad45c87000000b0067efe4e9e21si1094197qvh.593.2023.12.13.07.24.27
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:24:28 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-gFoFw0n-N3OMGFkG3xeaEw-1; Wed, 13 Dec 2023 10:24:26 -0500
X-MC-Unique: gFoFw0n-N3OMGFkG3xeaEw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28972881B70
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:24:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 25A4B492BC8; Wed, 13 Dec 2023 15:24:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1DF2492BC6;
	Wed, 13 Dec 2023 15:24:22 +0000 (UTC)
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
Subject: [PATCH v4 08/39] netfs: Add a ->free_subrequest() op
Date: Wed, 13 Dec 2023 15:23:18 +0000
Message-ID: <20231213152350.431591-9-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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

Add a ->free_subrequest() op so that the netfs can clean up data attached
to a subrequest.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/objects.c    | 2 ++
 include/linux/netfs.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index c4229c5f3f54..1bd20bdad983 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -145,6 +145,8 @@ static void netfs_free_subrequest(struct netfs_io_subrequest *subreq,
 	struct netfs_io_request *rreq = subreq->rreq;
 
 	trace_netfs_sreq(subreq, netfs_sreq_trace_free);
+	if (rreq->netfs_ops->free_subrequest)
+		rreq->netfs_ops->free_subrequest(subreq);
 	kfree(subreq);
 	netfs_stat_d(&netfs_n_rh_sreq);
 	netfs_put_request(rreq, was_async, netfs_rreq_trace_put_subreq);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index d6f27000eeb0..06f57d9d09f6 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -214,6 +214,7 @@ struct netfs_request_ops {
 	unsigned int	io_subrequest_size;	/* Alloc size for netfs_io_subrequest struct */
 	int (*init_request)(struct netfs_io_request *rreq, struct file *file);
 	void (*free_request)(struct netfs_io_request *rreq);
+	void (*free_subrequest)(struct netfs_io_subrequest *rreq);
 
 	void (*expand_readahead)(struct netfs_io_request *rreq);
 	bool (*clamp_length)(struct netfs_io_subrequest *subreq);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


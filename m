Return-Path: <linux-cachefs+bncBDLIXLMFVAERBGPQZCVQMGQEXTTQANY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2A7809393
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:24:42 +0100 (CET)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-67abf4618a2sf28394216d6.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:24:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984281; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZZuC/nvkdmsd7NRnNpkkK5AxT04Xrryw2aqYe6vSR+phcsMvi2zk3q1BbzNixohc7I
         U13mvdxlp8nvJXmRPT0V+h9WCRmi/zNSr6D8ptD+byXjpscQVVWh7Jm0j9TN90LiMYpq
         jZoGQn0mluJO1dUVkuT/7jBGOgfhq2sw3aoYezz8vobEvJv/HRnM86/1m46ZD8SypsTl
         48QWgnBr6PM5KMhPXijGpyBoMIvN8v01ko78vAkQIi+cVhM1XxImJUVszhGdPPpYI/Hu
         BpFGRk5pT/EnPskp3OHCuZbFjQyea8MP9eBqxpnUWLEqrDrm1+qRTj3Xt2vHVAn5nR9H
         FHGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=dUdbK5DSVZBsEiSSw1YUT1MjzC66WowPkXLPGms5Cl8=;
        fh=sYq5GRr4z4u7NkcTE0XnshsPQiXi0MpumQuI5P4a1/E=;
        b=xgyARG9MIthE9qNq0QLOcULlpNuVWG75O6GnGsUaO28QwQyfOqGnk56pazWpRyRecI
         HqsJMhDIcCXPhbfoSrSiF7Oun2KmlZrTVz512Fxs3nC6iplhUe5sgL0mzeVVb3vk6Ouf
         35hdpZqrwMxZGlKIA4nE+V0/L60OQ4ZU4mzXJBUESLgCk+nYkTeW3wXqDCc+MwI0km/O
         eOvH1phVU1mEnMSu8+2ypW/rLiTsVzQv5hiQJVJA4zewkhlu/UwB8nXK4kC6Z9DT2A8d
         HObe3twavzu4MhKtHWhkbgkPTkxCMrz/s3LKSxGt1r7kzJIrzTVFQXSI4c9WN7jfTqnQ
         VXCA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984281; x=1702589081;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUdbK5DSVZBsEiSSw1YUT1MjzC66WowPkXLPGms5Cl8=;
        b=dNGXsBNhDVsP+MV9YNPuLjwfs8jCWWITQe74nqe1uJYBXqHn5aTtWAgAAXLiRN6Zqy
         wtJ9juPJVVLKKBbbczD3i2J+yShWbbTGhH4al3txK0/6h0P/GYJiAcATrcyveZeIa8+2
         3D2SNMRy3obUYnzOA7xb8Fx5XQRmt1vJUYpjBEBPCbw2y5kGFYEM+DZgv3+ZKJAI2i4Z
         yuFPbzXHd8pdHTVKOxQ2ZPKmK43T1M7N2B0G9pbgxCZI2TFi3o6UDlYUtrIvL6TKPpaJ
         H6+MRLkmMtJE4uCgjvS3tYFiWZL7MyXFvTH9Y27MmUwGiloMjycPztCC/iRvnPxr4f+m
         Bqzg==
X-Gm-Message-State: AOJu0YyMKV3AjN/3KFDsTthcgYEKLR30+O36QhgWQge6JwaWim/g28+2
	v87+vbwIMNcpV4mMRrKkLRdpCg==
X-Google-Smtp-Source: AGHT+IFF1Q03q527X6VopyncTenzKrTNxmgi0hxRJwnDQX5vP5SaarNVnKgp5YAyLutoYH6zG0fuYQ==
X-Received: by 2002:a05:6214:2a87:b0:67a:2372:30fa with SMTP id jr7-20020a0562142a8700b0067a237230famr8780968qvb.16.1701984281755;
        Thu, 07 Dec 2023 13:24:41 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:e80c:0:b0:67a:94b0:82e8 with SMTP id y12-20020a0ce80c000000b0067a94b082e8ls1880302qvn.0.-pod-prod-00-us;
 Thu, 07 Dec 2023 13:24:41 -0800 (PST)
X-Received: by 2002:a0c:b559:0:b0:67a:5be3:f0f8 with SMTP id w25-20020a0cb559000000b0067a5be3f0f8mr5153626qvd.19.1701984281227;
        Thu, 07 Dec 2023 13:24:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984281; cv=none;
        d=google.com; s=arc-20160816;
        b=Vy2cHpLyFiTcVa/07KRwRhNqY8OCek5+UJHA6eW/786AmUID7S3N2ckVdgzJwkPYw+
         /uAKUMTNQwfGiS1zAEjMt8gw9WvDCdeQCIuss1ufT4nhEUuMj4VHt1Q+4DI+VAOEJPGe
         8CQk7rB7eO8mSbORe7RJwOJr857+p0ZKA3k6l//OHyLHblYmhEg2i5aaIua2RrfML39s
         U3VGYbnMuk4IAF0ud2LLSMH+HEijpQvZk8WjKeR77mnp5O9t7k0J+FucEVBGlMsXipAF
         KhRfuo1cub75JUx2flH1vr8Jt71h3+tsQKbx5lq1IQki7EFB6TmDFle5VjQj/BIbaHpN
         qbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=OEFFzyp4bFEviL1/y5nIotsUE5u5dYojlggq/vI/x7I=;
        fh=sYq5GRr4z4u7NkcTE0XnshsPQiXi0MpumQuI5P4a1/E=;
        b=Rmb3G2GXoPDVwPvdJRLWknmi/fKPC5gWe81hXJ0XInJoCcZ1CQKwY0Mfl3VUrWOK1D
         UOSsY7bUmO+SAkFgozhq7m88co+IiqRnwaejjX98TjUPlrzkKIXzvEUJh7NcWsAf/vFI
         VWjwgmZCGV6uzzYU6EU1JbbkUqoAx11+HAEZHgvX8yNYxyDxEehVJ0iWncFVxB4N+3CR
         /2sLmUfZvYaAvMCaeK1P3v3FsiWxWPP8Ne9m7gkPKhBk5Z0Is3KTKsWnef+5V4QJcWq9
         4My31eeZ8aVDnd06w2AFYUAqmLgRruwFYOOm0WZInqXqGkULFE9DiWxhp9RjhI7AuAL5
         wbnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id cv14-20020ad44d8e000000b0067abba024f5si610508qvb.506.2023.12.07.13.24.41
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:24:41 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-aOFQTyL_O2iF7CClx0xGwQ-1; Thu,
 07 Dec 2023 16:24:39 -0500
X-MC-Unique: aOFQTyL_O2iF7CClx0xGwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C3D629AC011
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:24:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 784BE8CD1; Thu,  7 Dec 2023 21:24:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B7058174;
	Thu,  7 Dec 2023 21:24:36 +0000 (UTC)
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
	linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>
Subject: [PATCH v3 43/59] netfs: Rearrange netfs_io_subrequest to put request pointer first
Date: Thu,  7 Dec 2023 21:21:50 +0000
Message-ID: <20231207212206.1379128-44-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

Rearrange the netfs_io_subrequest struct to put the netfs_io_request
pointer (rreq) first.  This then allows netfs_io_subrequest to be put in a
union with a pointer to a wrapper around netfs_io_request for cifs.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cifs@vger.kernel.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 include/linux/netfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index e44508850ba2..08040da65336 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -207,8 +207,8 @@ struct netfs_cache_resources {
  * the pages it points to can be relied on to exist for the duration.
  */
 struct netfs_io_subrequest {
-	struct work_struct	work;
 	struct netfs_io_request *rreq;		/* Supervising I/O request */
+	struct work_struct	work;
 	struct list_head	rreq_link;	/* Link in rreq->subrequests */
 	struct iov_iter		io_iter;	/* Iterator for this subrequest */
 	loff_t			start;		/* Where to start the I/O */

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


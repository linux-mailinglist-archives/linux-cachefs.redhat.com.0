Return-Path: <linux-cachefs+bncBDLIXLMFVAERBY4Z46VQMGQES7N2YEY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B15811656
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:25:24 +0100 (CET)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-67eee60d80bsf15846906d6.1
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:25:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481124; cv=pass;
        d=google.com; s=arc-20160816;
        b=posl5GSR6JXAZYTBUj8SP7x4R5ASQM+4eSQO3AV7aHTECYB+xCVNN3ZZqukIYOxFvs
         cHtvsRARNhXhjd2GuxhL6Mwvh8SBIeUqpbCRnkYDjD2SaxoglX1tCvsV3OVeZCC0peJr
         +Myay8QVhY7m4t3nFzZKvGFJKHYeSqT12rljlUP4GPSQMHJ0WyNHMBX/pYaRffQiwzvy
         cQ3tOAOTm8jtI6H+qzCe/7SRd2/bWKpsDEtuzaAXFsNykbgXhcJM5G0XVtRFV9/OX/R6
         6JCIDiTq6dDV1hMz+laNuXmTUxwZEj3oZdb6Q/nzOZawQz/26qUBHX5UJqVbggxSNwHh
         E2Vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=vg+UQocrxCS2RyO8hes5F6qWzRfb+R7UwHA1qo0Q6Jw=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=Y+6LfGJWCkaGHzaI7/FahS8Nk2RLikzqvXBR78hd7pKVgKSRDaWOS1ZmjqwvwHmf+x
         YlBX2QikE3idBqd6qd6ae6h3dWozuvTZVSmIvB8W/26yAL5shffnTbX7+mgE/h5adgPz
         wlewMv5uSnCQAm4eHJRYsOw4pEMuJ30xxnXycdMfhk76xvkEaebGDGTjlDtTakuHJhTI
         LC4T2l3taGJUbKXAJQ0/s47HoAet5fC225qBEX6Ti9wjEZL+1iaGPk2a6bZcI4OWPREo
         zFtfny+eLdfHiC5Zh3/vhcOJo9Y1ecIQQoJ/MXsibjzRMKR4RXQSJYwF91AH7tWbW4Gq
         K46A==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481124; x=1703085924;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vg+UQocrxCS2RyO8hes5F6qWzRfb+R7UwHA1qo0Q6Jw=;
        b=L0eUUi2OJg33k56J0zYRpb+vOBfW9yB4kO/MRHgsLzEIH7Fm0bK8JOfFnuSDkDXv6B
         +lxwWqvqpgkXwYCZtC4Mj81TsNMGUi3aE2UXhxIzTWBPOdx0x32AOWvugrBDBTdZW8KE
         fZdh0SLJgK2R7h5GyOPntQxIZhlyMMMLa/DtNiG7nsNtHkJvTVQuHgGdUSxx1r1EVF/Y
         BmkFNpqqpqXG5t0EaIN/wBsySU3aYp/tVGnreET4HfV/XAA6R7UxOSBfDZYwYCLKU3vb
         kzV0+yw0qxcgNA5Z5k2f5AdH8sTszwqxtcTeIArVryXt1g8ZzhmfoKMqNx6AGbs/eQOC
         eQuA==
X-Gm-Message-State: AOJu0YyGpNEdDV2hNMN73VMcPoxLrjwybsxmE/AMrhA9V2+8tlp37TsG
	G00hkgde4VQsvXyzWV/y6DzRkQ==
X-Google-Smtp-Source: AGHT+IEduWbyNZriw+s3WfzhylRjMWiakbybXzoYUMBr01lH1n2bin0aWWwSpCmdxjCsVGR4XXEoQw==
X-Received: by 2002:a05:6214:4109:b0:67a:afde:823 with SMTP id kc9-20020a056214410900b0067aafde0823mr6421811qvb.41.1702481123953;
        Wed, 13 Dec 2023 07:25:23 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:52ea:0:b0:677:f602:655f with SMTP id p10-20020ad452ea000000b00677f602655fls3070211qvu.0.-pod-prod-08-us;
 Wed, 13 Dec 2023 07:25:23 -0800 (PST)
X-Received: by 2002:a05:6102:292a:b0:465:db7b:3921 with SMTP id cz42-20020a056102292a00b00465db7b3921mr3231017vsb.25.1702481123187;
        Wed, 13 Dec 2023 07:25:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481123; cv=none;
        d=google.com; s=arc-20160816;
        b=oWiN2LYTYYF6OS7VLia4zCyDdIN3N7W0ElVEInfjoshXXOT+s2SWv7N/id5ff/8l6x
         90rZaRAvWgIQ9aGDXTH34dLkFxW0qOAqELBM8NbIk/dcM1Z02k4Klu5/RJTsHQmG8BoC
         qS9Zu+mB/y8GArJt+u4sx3SyOyKuQj04e91oXp2AxZ4YzEzcpWRUnu2N/sjBtxzRCkFE
         hNd1dpZiQQdDdTdaIjlTojWWrPN0SUcZ1Ds06lx4Y4rQ3EAHcx523G7BXC4LyruDcHxu
         HobJ//MVnc3cQ2x3CjzPMWBuSLa7Aw1DGQ0DUcuU1MYJ+e0nJESfT2UbswiI95pBJsnP
         0hSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=VpkcpqQGFjGGotXxykSSFj/z2Mj8Id/3cGjDF6fP5aE=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=W1xLfsloqHiqVlhhDzUeqK5TH1sCC0zQhmaFvMA/Tda7Z/25APyOIJ7o1wJT4iwvv1
         F6EHzi2md7F8OuYOxzAfEtsdjAD8XzPGZtwLEaZ3HlR8YVrbKphd60vpYHo4X13R4Rrz
         Zq3R145n8x+b0S3HYpbI8Gw4bww0FsLr20cedfxo4nXCrPoRpBJjWqyzjZ1UFJSGiZ00
         1M+/TRmAsqjXj3LvxTL9Ae7fHEI2n11czA8SZ+BkKUKIYRpY4GXsNtsYlX+Q90qj96m4
         Px4zJDhWI2RxLwsV/hWTE/USyFX9QMEjKss+3bMOSWNsvYHlk+oxYV04NrPDVWWQ7paA
         0pUg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id s22-20020a056102301600b00466048d4688si1812255vsa.373.2023.12.13.07.25.23
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:25:23 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-633-ZwRkoeaiMpW48-BZysEqgg-1; Wed,
 13 Dec 2023 10:25:21 -0500
X-MC-Unique: ZwRkoeaiMpW48-BZysEqgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 485971C0BA51
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:25:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 451FAC15E6A; Wed, 13 Dec 2023 15:25:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 54C0BC15968;
	Wed, 13 Dec 2023 15:25:17 +0000 (UTC)
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
Subject: [PATCH v4 20/39] netfs: Add a hook to allow tell the netfs to update its i_size
Date: Wed, 13 Dec 2023 15:23:30 +0000
Message-ID: <20231213152350.431591-21-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
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

Add a hook for netfslib's write helpers to call to tell the network
filesystem that it should update its i_size.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 include/linux/netfs.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index fce7a5a86e8e..a14af93efccf 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -245,6 +245,7 @@ struct netfs_request_ops {
 	void (*free_request)(struct netfs_io_request *rreq);
 	void (*free_subrequest)(struct netfs_io_subrequest *rreq);
 
+	/* Read request handling */
 	void (*expand_readahead)(struct netfs_io_request *rreq);
 	bool (*clamp_length)(struct netfs_io_subrequest *subreq);
 	void (*issue_read)(struct netfs_io_subrequest *subreq);
@@ -252,6 +253,9 @@ struct netfs_request_ops {
 	int (*check_write_begin)(struct file *file, loff_t pos, unsigned len,
 				 struct folio **foliop, void **_fsdata);
 	void (*done)(struct netfs_io_request *rreq);
+
+	/* Modification handling */
+	void (*update_i_size)(struct inode *inode, loff_t i_size);
 };
 
 /*

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


Return-Path: <linux-cachefs+bncBDLIXLMFVAERBS7PZCVQMGQECHY6VPI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C382809362
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:23:24 +0100 (CET)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-77d7bfcceaasf121934285a.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:23:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984203; cv=pass;
        d=google.com; s=arc-20160816;
        b=l2xOga+pjiANOccRc4dHBDjPE/RmBxfWPPy2Kp6Uw1y1+AZh3HYzXvxA1YZxuL9yar
         PYt+TXEa36PITSm/TF6WiQzT9kbh+TFVGn6Id8x6ZDji4SNYIjcIVbmWUoO4bkABmArU
         RaEk0Hrzs6Dnww1cnO9az1XHa+8FQixncpncdnTNDAkfc/k4AJlk+Pi5GrKTB6ILR1Y+
         G+tohhSgbP3B+6ADIAe0Ib+V3TaSKHhzFDswG/l0urLkju8yZHkjxYkT2wBOZqrxcPy4
         FgLCBC2vg8ZasNVBiTWB1GXY4rkfPNNK1DPj2Hskq7hDrNZDrCW7OTw71tsEsbih/2iT
         OAPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=vg+UQocrxCS2RyO8hes5F6qWzRfb+R7UwHA1qo0Q6Jw=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=cDugS+aEH5qdAemORCO/+bqaLiSrRzZ9FjZcVGltaeTUlrOwlBV/kTP056pXJyzZKO
         ym1M5JBPyiAAfVRDZcEe03cQvIRf8dpJw1jGYC2mLG6H5ictFgY+R8ccjkySn4LRxKqn
         sl33kz2qXd8kWf7wJIbbrYJeUNHItnj6x8KPtdLpOjlu/GSG9LS0ebfahg6ZpKytm0er
         wAv3sEKyKZXMsB2hfhYWu6uijeXvWdTWnGY98IkNA1i5Ft6NWyqKpNT1BshclkAYLlDm
         4zZOWORT/GivXzV9Ihd2UUynYg2uBAsJz+DkSeEw48/Q0wTduFYBZlD6gWRahW+uWxZe
         FKNg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984203; x=1702589003;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vg+UQocrxCS2RyO8hes5F6qWzRfb+R7UwHA1qo0Q6Jw=;
        b=qHFgvf85psmRZAvHj9QrYVjXf6736MGwGPnxz2eN2V2Fozci6POINK/yuCzCtrP4Pf
         cD2/x8GXBzwihQO06mm13KrStkJKqmZn5FdP1kNjo4JXgeNdRD/WbyM3bcbEmU//vVcC
         cz9U6hGR3oHW8knJGpt4bnEFAxJJWryVyH73cLVU8A/JkfaNOm1z9kO986Mj8J0aDjBl
         LiXOuZo9rwiJIPzV+O6Y8cpuLhC4MSC14u/83NLnQnu6I3JcillEcPbbkFupe3zSoSnr
         azJTSh5H2ccVsqE5cZJ9GsnwZO5DTg8vjvkY8qNbmnRE/De4jV4Ay1i9NzLfpgj9qyxV
         Lv9Q==
X-Gm-Message-State: AOJu0Ywl5bs9Y5gAJKl+hIOAbRNH7TgppHYtlyEh0OX5Q2tOAZTZ07KG
	Tv5kg4qj2QL7pY32AkWK976kwg==
X-Google-Smtp-Source: AGHT+IFCnS9wTaL1CejBART0nXWAk+SmFnth9UMrMNjhxn868dOEEvbVHVNYFt7LuTQBJeO0ABqtYg==
X-Received: by 2002:a05:6214:9d1:b0:67a:99fa:f8c9 with SMTP id dp17-20020a05621409d100b0067a99faf8c9mr3089658qvb.13.1701984203547;
        Thu, 07 Dec 2023 13:23:23 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:4e10:0:b0:67a:94b0:82e3 with SMTP id dl16-20020ad44e10000000b0067a94b082e3ls1216011qvb.0.-pod-prod-07-us;
 Thu, 07 Dec 2023 13:23:23 -0800 (PST)
X-Received: by 2002:a05:6214:140b:b0:67a:a721:e156 with SMTP id pr11-20020a056214140b00b0067aa721e156mr3976403qvb.131.1701984203006;
        Thu, 07 Dec 2023 13:23:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984202; cv=none;
        d=google.com; s=arc-20160816;
        b=rVXlgto3bqFZvTFK3aTGgEMvq0/eTm9LeYQRvCUV0ybtmkJ1fUFpC0SE5O8DryftYG
         jdEFhq1JGIvIvmmLfxZKADaOOYus2XNqQ21x0ShKQeFzS/lGqVgtU0UJnADr/CEMX8m8
         z1nF821pbMDgVDgHZMTpMTg4L7gT4F5ZTvlwNKFOkQCU3vvt05nJ5vvGddPJC7rfNCGm
         ffWhhQFMcSy8R5QDGead38H4TUBZrDeg3ukBp4t9hQ4pdjVWF/S9qUd/Er8jcupd2EuY
         wCrBtUCwOgk3coxwYUP/cr1kzHhh427Gs4/RwHRiirzibNqr59JG0H8KxA8pSOSdIj/U
         66DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=VpkcpqQGFjGGotXxykSSFj/z2Mj8Id/3cGjDF6fP5aE=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=FycQMahk62rXgVC/LrWw1N8lnAdvE1c377WTfXWaj18JrTCoXiHgTaxD/G+Q0Rsccv
         Chp8bWk9s3a2MZxuy6b7iXINhm37MDOGfr2MsdXcHL4aaCuDB0cxfsKk3wYPvSTmZ6GL
         Nl4P0VmrdxpIi2zrHTcZbPpKcPETgeFs1oxVcfQANkrALRH+mofbuucsAxsF18diMHuE
         KCvCMWpzMIy+Qvz5f56LIaA/XssgsZIHS7A6S2UbcR4HhWymiC7PsAJTFQ4mY/1sGG0S
         FnOytZnOQBZpSSW0TVTe3QGWgNaO7uHI6Wbku7cr7MXeFruShPpPOV3+UyyZuXrNDzFB
         EjZg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id bs33-20020a05620a472100b0077d7db62ccfsi659642qkb.231.2023.12.07.13.23.22
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:23:22 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-aswOUjstPNq4wX0k4j8y-w-1; Thu, 07 Dec 2023 16:23:21 -0500
X-MC-Unique: aswOUjstPNq4wX0k4j8y-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2754A85CBA3
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:23:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 23AD540C6E30; Thu,  7 Dec 2023 21:23:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C37740C6EB9;
	Thu,  7 Dec 2023 21:23:18 +0000 (UTC)
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
Subject: [PATCH v3 20/59] netfs: Add a hook to allow tell the netfs to update its i_size
Date: Thu,  7 Dec 2023 21:21:27 +0000
Message-ID: <20231207212206.1379128-21-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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


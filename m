Return-Path: <linux-cachefs+bncBDLIXLMFVAERBRPZSCWAMGQEI2UKZ3Y@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 108ED81B769
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:25:27 +0100 (CET)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3bb7afca4e8sf175374b6e.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:25:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165125; cv=pass;
        d=google.com; s=arc-20160816;
        b=vPx90mk1o8WWkEIKj/IlsyXY/uoE8+mrBYwfHGGD/vQWjRHEY8eIRKeKS+rmglP6Jb
         XvNlQ1B/G59E9Fl0fwmKvNfM52SyIePmpCK/Jqt4hXG7jbBwjDy9m6aClEBWSRbeqDIT
         DcMZELvAmtp7RohQpyOn+vX5cFXtYf7qyFnf5doG0WSs6fqrAiXu1xoz7WJy8uCxOz4K
         PQ+AwAHDtHcCFzc1pybw+sTOYXmIL877LZjZhwM0XQPOqB63s1qrV83h9M6XDDsAt61S
         OpAqYf4bcqhi5Bd+Hak6UldHi/Y7Mpt0qVi37o22HCqjxbWblkptT4uDkWMQjgDW5zqh
         3gCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Qzyvh1wSUXhct+rpU9/CQQZborQtpNL8rRd+APgHApg=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=CNJn+uObIPA/A6LLJhvX/atlxhVn6EnccF1s9kcGJiO1yN8cX3O8s2n06eX//Oa6bk
         mp97cspg4fhYReCqvTQwdr4yWpQXydRpjnQT9DKZ47QOAfgrzSH1VSYR5D43IfxGIzmm
         CRvu0QbVwrAm4XYnU/dKlxXuRAMcRxeJNlGRtdWuJLCBtHI7ncdjaTIubOcJAlYBR7mY
         ZFJxIX5IbunITWDfy41qbqD3mYBkQXps7cvB+oiIjPtDcXD0ki52gsryKt7mQxGxo2Pn
         zujHqGWXxZTU8XEgrfOyuTOrl9jrxWTI8e/wHV1C9Xe+uMWXJHGOH7R21ArL60r6tQKV
         E1aA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165125; x=1703769925;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qzyvh1wSUXhct+rpU9/CQQZborQtpNL8rRd+APgHApg=;
        b=qeI8aBbznJX0eie9QlWk02edK0N4Xvx8kvef4+IUk+qoXDQAcrxChOW2aazovZHjIH
         vBTxPrfqj3WWL7JcEAlii3InZpNjhIRWCi86VLZMAvbaJ7S8AHhKwDQKvLk4HiW6Xk58
         AVREaXT9P/pWQ+c4tnWmBw5TiGTbXIJuoDn3hDnJFcDToQLdL1A3Y0AC47OiAR6cKqjs
         LkjoJgc99bcgCDMBHW5Tb9QOzSAUXPMa/E0Ww+LfWgSGCxqgKdvbCI0qIUiNqZ2XlTOu
         szF5m9Exm0WinCWTNHDfHzoZmTxgu23h1SrFCUjdT4DJBt5Gj47Hyk5fuDw4nzdnzdKw
         B60g==
X-Gm-Message-State: AOJu0YxfoeTpvqP+B0zaCS2joYimVd0m1/bUUwZQC0ZKBOw53Xhh1a0+
	XiIbZSDbOysnhJLLq4yDHu+h3g==
X-Google-Smtp-Source: AGHT+IHubLrXfXSR2/lsLBonJb3pvkk2SnaPGe/5PIFRV40vaVmXTaHlL0swS3spOkou3xtgQE+Yvg==
X-Received: by 2002:a05:6808:1795:b0:3b8:bb75:db16 with SMTP id bg21-20020a056808179500b003b8bb75db16mr41139633oib.2.1703165125689;
        Thu, 21 Dec 2023 05:25:25 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:5c6a:0:b0:67f:da:bf48 with SMTP id i10-20020ad45c6a000000b0067f00dabf48ls998106qvh.1.-pod-prod-08-us;
 Thu, 21 Dec 2023 05:25:25 -0800 (PST)
X-Received: by 2002:a05:6214:d42:b0:67f:42de:2846 with SMTP id 2-20020a0562140d4200b0067f42de2846mr8188241qvr.68.1703165125030;
        Thu, 21 Dec 2023 05:25:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165124; cv=none;
        d=google.com; s=arc-20160816;
        b=gRf8nxTw7hPOfFsVeIUVE3X9+Tl52PuFvQo/93L+LoiNNEQHwE0aChTeCy74OryHC0
         hfXLCmVyc9kOPUWbHrvPafFrmpHefOPP9byzbfq9EnUhpUVxqj3l9XlmGPKzpAYR8xch
         SecZptOzmf5lvBez64n1om8en8lWU5DSkueydNY6UKxO1Yq+BhSwMXhE4VvIS60jc5cg
         Uk72iqZsfze55wVp21JrTtuk8dyL+hB0w9d63QxxH73bSYYXf8QWU/KnLGjFvOgswAu1
         mulGles8FC30RBgEGaYiNCinJrXQS+hPtMoYBtXA0gvzWTNuHjGiClVnn8Sj/ZWq3opP
         tBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=X8K+OvIZVFEHRX7sH3CruOEYZX1ff0eup403Lbxotk8=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=n0TJGE8KD0tVcW5TrGbVEGgWvUk7MHZWc8+A2CbGUsZDTO7CQjetu3l2bTxdlzs0wy
         vAJQAVMZM2im7BguD0qalH23uuyOo6YWMehPUkfpUgrvvzY3ovC7+jFsO6VY9eCPohH9
         XT8togIoieoA0NJILC8B0jrDzwhk+n3rbmr7UXtfUN8M4wzYDuGQupoGYIJSmWuQ12Fd
         ibkH3qmkBDfv2K2c1ioqdd+oNtsPMoBCrA0hXp4ix+h+nqaCpftpXZk671C+n+Rc2M3V
         c0tdw5nm5K5AN9yT5xOsuukF606Jb7l0RHlCduLBuXmGJmcm8RBWw7luCWq9BZ1jia+P
         2yAw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id y8-20020a05620a44c800b0077f75c6421esi2229695qkp.637.2023.12.21.05.25.24
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:25:24 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-XgiT_v_YMiSNYEDxknvkzg-1; Thu, 21 Dec 2023 08:25:22 -0500
X-MC-Unique: XgiT_v_YMiSNYEDxknvkzg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90D78185A785
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:25:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 8E6F6492BC7; Thu, 21 Dec 2023 13:25:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ACF17492BC6;
	Thu, 21 Dec 2023 13:25:18 +0000 (UTC)
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
Subject: [PATCH v5 20/40] netfs: Add a hook to allow tell the netfs to update its i_size
Date: Thu, 21 Dec 2023 13:23:15 +0000
Message-ID: <20231221132400.1601991-21-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
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

Add a hook for netfslib's write helpers to call to tell the network
filesystem that it should update its i_size.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 include/linux/netfs.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index d08bd37bc3ce..f87193fa0f16 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -243,6 +243,7 @@ struct netfs_request_ops {
 	void (*free_request)(struct netfs_io_request *rreq);
 	void (*free_subrequest)(struct netfs_io_subrequest *rreq);
 
+	/* Read request handling */
 	void (*expand_readahead)(struct netfs_io_request *rreq);
 	bool (*clamp_length)(struct netfs_io_subrequest *subreq);
 	void (*issue_read)(struct netfs_io_subrequest *subreq);
@@ -250,6 +251,9 @@ struct netfs_request_ops {
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


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B9054467C
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Jun 2022 10:54:25 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-dhl1ixjoP_ipz2cmANgDdw-1; Thu, 09 Jun 2022 04:54:21 -0400
X-MC-Unique: dhl1ixjoP_ipz2cmANgDdw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F093E811E76;
	Thu,  9 Jun 2022 08:54:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC5DF492C3B;
	Thu,  9 Jun 2022 08:54:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8A73E194705B;
	Thu,  9 Jun 2022 08:54:20 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8A51B194705B for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  9 Jun 2022 08:54:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7CD431121315; Thu,  9 Jun 2022 08:54:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78BB01121314
 for <linux-cachefs@redhat.com>; Thu,  9 Jun 2022 08:54:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C580811E87
 for <linux-cachefs@redhat.com>; Thu,  9 Jun 2022 08:54:19 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-nXFshOHAPJKkUaXNuBAwGA-1; Thu, 09 Jun 2022 04:54:17 -0400
X-MC-Unique: nXFshOHAPJKkUaXNuBAwGA-1
Received: by mail-pg1-f173.google.com with SMTP id d129so21240375pgc.9
 for <linux-cachefs@redhat.com>; Thu, 09 Jun 2022 01:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:references:cc:to:in-reply-to:content-transfer-encoding;
 bh=yMejwtDzyNHfBpGN72so4O9xVLTuy+RaVh5U8x4L1Hw=;
 b=FQLGxta6BgagZH+NH+tWzB+G/WMVyg7bZMIuTbbzS4uZX2mkbxB83olFDUQCND2OPO
 Du/fKEaRdpXOTtnZ4QJIpR7fULtEoTcAmbsqWkQV02ydajOn+1DHQqNbBCTmwURYQxBC
 irtLL9gavTJiL8CGj2W1r3Lq8krFWy3xOv+40AV47ppJJ5twmUSC1pzh8IpTRruu37hx
 rUV82RJuIk4VVoavRQZPZfXFvkq6xNQbqfZe5Fpfec0C5TmCfHGFwBB7AP4dPxoy98a+
 stxky+UT0D13SA2hWPvw8bxos8AsxJQPskp4LijAlvpucsuc775+zPj9AuQ5iaJZiJLt
 +56A==
X-Gm-Message-State: AOAM530TUynh9+cdsHPCLv3vGlH1ZXEROgUFsFhqbyP/3XCxn+Y/Xpui
 KZ7RG0SARwXV65qXmotBgRKW/Q==
X-Google-Smtp-Source: ABdhPJzxfd/E24V2utRYzgKSQLHaTAVb/3N1dFnRzIUtmrYnB73swM5xvClMwqfebmQRh66X5KdXcQ==
X-Received: by 2002:a05:6a00:22cf:b0:51c:11c2:4bb with SMTP id
 f15-20020a056a0022cf00b0051c11c204bbmr21752464pfj.54.1654764856475; 
 Thu, 09 Jun 2022 01:54:16 -0700 (PDT)
Received: from [10.76.37.214] ([61.120.150.71])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a170902680c00b00163247b64bfsm15698498plk.115.2022.06.09.01.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 01:54:16 -0700 (PDT)
Message-ID: <b62a09fc-a42c-72b5-eb42-37b52b3d529f@bytedance.com>
Date: Thu, 9 Jun 2022 16:54:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
From: Jia Zhu <zhujia.zj@bytedance.com>
References: <1a03d5de-e0cf-b23d-b12a-f46795125968@bytedance.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>, dhowells@redhat.com
In-Reply-To: <1a03d5de-e0cf-b23d-b12a-f46795125968@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Linux-cachefs] [PATCH] cachefiles: narrow the scope of flushed
 requests when releasing fd
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: zhujia.zj@bytedance.com, chao@kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org, yinxin.x@bytedance.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


When an anonymous fd is released, only flush the requests
associated with it, rather than all of requests in xarray.

Fixes: 9032b6e8589f ("cachefiles: implement on-demand read")
Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
---
  fs/cachefiles/ondemand.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index a41ae6efc545..1fee702d5529 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -21,7 +21,8 @@ static int cachefiles_ondemand_fd_release(struct inode 
*inode,
  	 * anon_fd.
  	 */
  	xas_for_each(&xas, req, ULONG_MAX) {
-		if (req->msg.opcode == CACHEFILES_OP_READ) {
+		if (req->msg.object_id == object_id &&
+		    req->msg.opcode == CACHEFILES_OP_READ) {
  			req->error = -EIO;
  			complete(&req->done);
  			xas_store(&xas, NULL);
-- 
2.20.1


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


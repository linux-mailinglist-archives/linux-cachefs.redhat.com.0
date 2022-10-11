Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB575FB318
	for <lists+linux-cachefs@lfdr.de>; Tue, 11 Oct 2022 15:16:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665494184;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z0cM36Da5vNV1WiFwcJGndcE2hKsZTFS1vhKmpWd16w=;
	b=E9IaR/j76EmJFoGdOgekOhdi9DwSqmoRZmm/UJ9CcwrpY1pjb9OyHG3DbqEU5wSZqbAl2b
	ZMuo/pIGVoeuG0vLfdepFMXEhT22wrVA3lnG96gAg0TkHJtx8Yde6+isbzmK9Wbj093jk/
	H4uEKv7XXruVz2Sp4SU9NAhK2Xi3F/4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-fCl1Aa1VNfas7usGvIjIRA-1; Tue, 11 Oct 2022 09:16:21 -0400
X-MC-Unique: fCl1Aa1VNfas7usGvIjIRA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2504187B2AD;
	Tue, 11 Oct 2022 13:16:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1AB7B477F6A;
	Tue, 11 Oct 2022 13:16:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 01EE21946A45;
	Tue, 11 Oct 2022 13:16:21 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 057E219465A0 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 11 Oct 2022 13:16:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DBFEE492B06; Tue, 11 Oct 2022 13:16:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4635492B05
 for <linux-cachefs@redhat.com>; Tue, 11 Oct 2022 13:16:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAF6E1C0896B
 for <linux-cachefs@redhat.com>; Tue, 11 Oct 2022 13:16:19 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-392-VHO-DxvoOOOZbgbogA-2nA-1; Tue, 11 Oct 2022 09:16:18 -0400
X-MC-Unique: VHO-DxvoOOOZbgbogA-2nA-1
Received: by mail-oi1-f173.google.com with SMTP id m130so15804519oif.6
 for <linux-cachefs@redhat.com>; Tue, 11 Oct 2022 06:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P0QJPhughD80u7ewLF/tLA+xOCDrl/cfryqlkNyAxbY=;
 b=p4eWBBVsk20023Z52AxXHuYlVf46RoyPtMSMEVyijNwbnf3kAD0YqAr4V675R1OnP7
 Wdpfnm6H34/bv7sD2waKU9pXdDAykbGDRRDGjAzUENXvHiyZ/jXiNU9OLPzdcsnlD/Y/
 8VPZLSWQdhf+yVohUtTnL46KHxbD8uHkmQ4W9Ac30PnyNNIXwdiemZN2P3ddhVnHGpR2
 FDbgZUHVWo/BhmQO8bsD2vhheswMi2rpCPk7VqcHaYOgSaFowmOepEe0zcsAnU8tqbjK
 6NJZxc84WykMqW0eESfJAoBJoNOuZXlnRDYXgKVtTwx9VRNQUdraWVNk18nr5wXTGCG/
 Je+A==
X-Gm-Message-State: ACrzQf2/97+Hwp68hgSwpky5V+tjKf5laAdDHZoKcs8J4X01NXYAF77B
 BMVH7Bg6FOtait59RjYBprpaGNx18Z26RIHO
X-Google-Smtp-Source: AMsMyM6VuhiNMjdIO3SyvCAmXoE9oQdlr+6UO2h2kSoiH3hgKQ+xUOuHexT0ia7yWQdNOXMDI90tHA==
X-Received: by 2002:a17:90a:d983:b0:20a:ec04:e028 with SMTP id
 d3-20020a17090ad98300b0020aec04e028mr35546281pjv.122.1665494165504; 
 Tue, 11 Oct 2022 06:16:05 -0700 (PDT)
Received: from C02G705SMD6V.bytedance.net ([63.216.146.190])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a170902654e00b00181f8523f60sm4773415pln.225.2022.10.11.06.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 06:16:05 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	xiang@kernel.org,
	jefflexu@linux.alibaba.com
Date: Tue, 11 Oct 2022 21:15:47 +0800
Message-Id: <20221011131552.23833-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Linux-cachefs] [PATCH 0/5] Introduce daemon failover mechanism to
 recover from crashing
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
Cc: linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changes since RFC:
1. Solve the conflict with patch "cachefiles: make on-demand request distribution fairer" 
2. Add some code comments.
3. Optimize some structures to make the code more readable.
4. Extract cachefiles_ondemand_skip_req() from cachefiles_ondemand_daemon_read()
   to make codes more intuitional.

[Background]
============
In ondemand read mode, if user daemon closes anonymous fd(e.g. daemon
crashes), subsequent read and inflight requests based on these fd will
return -EIO.
Even if above mentioned case is tolerable for some individual users, but
when it happenens in real cloud service production environment, such IO
errors will be passed to cloud service users and impact its working jobs.
It's terrible for cloud service stability.

[Design]
========
This patchset introduce three states for ondemand object:
CLOSE: Object which just be allocated or closed by user daemon.
OPEN: Object which related OPEN request has been processed correctly.
REOPENING: Object which has been closed, and is drived to open by a read
request.

[Flow Path]
===========
[Daemon Crash] 
0. Daemon use UDS send/receive fd to keep and pass the fd reference of
   "/dev/cachefiles".
1. User daemon crashes -> restart and recover dev fd's reference.
2. User daemon write "restore" to device.
   2.1 Reset the object's state from CLOSE to OPENING.
   2.2 Init a work which reinit the object and add it to wq. (daemon can
       get rid of kernel space and handle that open request).
3. The user of upper filesystem won't notice that the daemon ever crashed
   since the inflight IO is restored and handled correctly.

[Daemon Close fd]
1. User daemon closes an anonymous fd.
2. User daemon reads a READ request which the associated anonymous fd was
   closed and init a work which re-open the object.
3. User daemon handles above open request normally.
4. The user of upper filesystem won't notice that the daemon ever closed
   any fd since the closed object is re-opened and related request was
   handled correctly.

[Test]
======
There is a testcase for above mentioned scenario.
A user process read the file by fscache ondemand reading.
At the same time, we kill the daemon constantly.
The expected result is that the file read by user is consistent with
original, and the user doesn't notice that daemon has ever been killed.

https://github.com/userzj/demand-read-cachefilesd/commits/failover-test

[GitWeb]
========
https://github.com/userzj/linux/tree/fscache-failover-v2

Jia Zhu (5):
  cachefiles: introduce object ondemand state
  cachefiles: extract ondemand info field from cachefiles_object
  cachefiles: resend an open request if the read request's object is
    closed
  cachefiles: narrow the scope of triggering EPOLLIN events in ondemand
    mode
  cachefiles: add restore command to recover inflight ondemand read
    requests

 fs/cachefiles/daemon.c    |  14 +++-
 fs/cachefiles/interface.c |   6 ++
 fs/cachefiles/internal.h  |  71 ++++++++++++++++-
 fs/cachefiles/ondemand.c  | 155 +++++++++++++++++++++++++++++---------
 4 files changed, 205 insertions(+), 41 deletions(-)

-- 
2.20.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


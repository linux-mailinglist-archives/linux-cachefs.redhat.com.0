Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 154775FE73E
	for <lists+linux-cachefs@lfdr.de>; Fri, 14 Oct 2022 05:08:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665716901;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3QHG+czcNNzQKTf+Q/isjqYBR8l9w+9l9wfTqFKakQY=;
	b=Z1SLQOkd2ZjsF7nxDBh2Bgto9RwEx/O6ur0bxSHWRAGCTqN9d0+ae1nJ9kHkgwRyOQ1SZz
	VSaTj/LxNdR6TUL8UW/kgDUOlSxo3B9yuBlQ/39jqTwLEASu05Wm8cOEdTbcWSMfzZsShA
	xaJQTMsAzAH33x12Bm8PgK/O/5qKJc0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-nQvXybAqO5KbQknpGoQ5yw-1; Thu, 13 Oct 2022 23:08:17 -0400
X-MC-Unique: nQvXybAqO5KbQknpGoQ5yw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ED9C3C01D8B;
	Fri, 14 Oct 2022 03:08:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22B0054F415;
	Fri, 14 Oct 2022 03:08:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B09D919465A3;
	Fri, 14 Oct 2022 03:08:13 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1BF2E1946588 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 14 Oct 2022 03:08:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DB54A112C072; Fri, 14 Oct 2022 03:08:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3613112C071
 for <linux-cachefs@redhat.com>; Fri, 14 Oct 2022 03:08:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF6D1185A78B
 for <linux-cachefs@redhat.com>; Fri, 14 Oct 2022 03:08:02 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-100-f9ZO2yq4NbimTnUkKQt84w-1; Thu, 13 Oct 2022 23:08:00 -0400
X-MC-Unique: f9ZO2yq4NbimTnUkKQt84w-1
Received: by mail-pl1-f171.google.com with SMTP id l1so3521844pld.13
 for <linux-cachefs@redhat.com>; Thu, 13 Oct 2022 20:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tR+LEXzrwnagFeN1X0qgpjAc8sXMoTZWp+ylsCx2Q8o=;
 b=tgGrxiYzYl9rHT8j8YTw3AeR8ExajrbHWqI+wz8Us70VcplTPuWholP0tReihQ0ezI
 nYpD4CXSPF0n0lGA1Moi9glBQ/kac9btasz2SKi+GFVgkItUCZgkIRxxEkMe+AdeZYea
 5DjKM6GxCulFOqGpD51vhqDcB2cIcyzNk/eRg89S1gPvCORdDYXXzsDCQEugQmpzsBD5
 vFQi3w0nHVHFuZNMQtRM9I96LQoLdvBmjaCDa5oEpaTeyFO3sCjFEfR2BnqNSIU3zvKi
 p157g+M7/IDqG6WgbblDt2Qf2mAPpoATKhOV8eDtPI1j+RkmVvGw6LaPcQKg32/I3cLh
 jJUQ==
X-Gm-Message-State: ACrzQf1GQrKzMFhIp6ANQBOmTkTip8LqY2o4Cvfq4NhCTI3wuiMAfBLy
 f2HcYMtz8x2kmpVPiAc9RaEBhg==
X-Google-Smtp-Source: AMsMyM6fZ2yYhCzfqcA1T5TPO16rRcN9qdwd1V7oXdpGUkUt1ol+W9QIVGnrnP7azUmdi3NbdWxY1Q==
X-Received: by 2002:a17:903:2307:b0:17f:78a5:5484 with SMTP id
 d7-20020a170903230700b0017f78a55484mr2957038plh.15.1665716879180; 
 Thu, 13 Oct 2022 20:07:59 -0700 (PDT)
Received: from C02G705SMD6V.bytedance.net ([63.216.146.183])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a17090a710400b0020ae09e9724sm425524pjk.53.2022.10.13.20.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 20:07:58 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	xiang@kernel.org,
	jefflexu@linux.alibaba.com
Date: Fri, 14 Oct 2022 11:07:40 +0800
Message-Id: <20221014030745.25748-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Linux-cachefs] [PATCH V2 0/5] Introduce daemon failover mechanism
 to recover from crashing
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

Changes since V1:
1. Extract cachefiles_ondemand_select_req() from cachefiles_ondemand_daemon_read()
   to make the code more readable.
2. Fix a UAF bug reported by JeffleXu.
3. Modify some code comments.

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
https://github.com/userzj/linux/tree/fscache-failover-v3

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
 fs/cachefiles/internal.h  |  58 +++++++++++++-
 fs/cachefiles/ondemand.c  | 156 ++++++++++++++++++++++++++++----------
 4 files changed, 188 insertions(+), 46 deletions(-)

-- 
2.20.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


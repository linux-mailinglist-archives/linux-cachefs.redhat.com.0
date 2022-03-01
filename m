Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAB14CBEC7
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Mar 2022 14:22:28 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-Rfl8DHOuO-SPKxekHLEvqQ-1; Thu, 03 Mar 2022 08:22:23 -0500
X-MC-Unique: Rfl8DHOuO-SPKxekHLEvqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAA42835DE3;
	Thu,  3 Mar 2022 13:22:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE2671064166;
	Thu,  3 Mar 2022 13:22:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F055E20C;
	Thu,  3 Mar 2022 13:22:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 221FXN59029524 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 1 Mar 2022 10:33:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9FC0B5881C0; Tue,  1 Mar 2022 15:33:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BE595881C1
	for <linux-cachefs@redhat.com>; Tue,  1 Mar 2022 15:33:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84785899EC5
	for <linux-cachefs@redhat.com>; Tue,  1 Mar 2022 15:33:23 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-414-IJqxKPvWM4e7dNI81xm6sQ-1; Tue, 01 Mar 2022 10:33:20 -0500
X-MC-Unique: IJqxKPvWM4e7dNI81xm6sQ-1
Received: by mail-lf1-f50.google.com with SMTP id m14so27497996lfu.4
	for <linux-cachefs@redhat.com>; Tue, 01 Mar 2022 07:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=prmKSGhcv4qkXSHWbirqB8YaQWTkj4DrLEbjqtVeJGA=;
	b=W6QVOkws3pen/V9rbGOkByU8Lzb9dF1BjCVEhFy8Pyad3FsF7Gg47SPO6fe2P86I9A
	tOOFm6IrP3GNZLamQimJa19XzDtNBm5wWaqHguZE9mLrqsy0racltx+SgNYz7LiYPOtY
	b3bWGWpETKq/qhyKxYgtE6f+DUmn7WE4cLX+VYCSVSmdATk2pIoDDNSUFCv7kjxEZBU5
	JllZ0i1jjRp9Q7+JcYiY6LR205Dgg7leN19XVbKth8N/Xe0p4VeU7Cb4MW/nJ0iOSYoP
	yM02YpIL3MyEtmvKpTvQcPANP57Jj9oNQaPIaEiCWTaW6RrFo6ja47jfISS3ImHkiR86
	uZWA==
X-Gm-Message-State: AOAM530m9byqh8zq7Bo4qKjsSRWf2rk5oK5WmRLpuA2ykEdNu3I4sHtI
	z+njzickRcIPZO12fdVRl0oo0fwliI9jQqVTHWZlTkyb4iKiGQ==
X-Google-Smtp-Source: ABdhPJwBEjLnyr6tTQeQkyZqFD2gxqySCwZaa2v++Zrh25SgDqRrABjoU7CIb3zdAqo2pri9YYkNXUD1tx9pB5eSzA4=
X-Received: by 2002:a05:6512:2387:b0:43d:165:b5d1 with SMTP id
	c7-20020a056512238700b0043d0165b5d1mr15752044lfv.510.1646148798372;
	Tue, 01 Mar 2022 07:33:18 -0800 (PST)
MIME-Version: 1.0
From: Chris Chilvers <chilversc@gmail.com>
Date: Tue, 1 Mar 2022 15:33:07 +0000
Message-ID: <CAAmbk-egCMVm0s8P8y455HF7cWyReC0cjnQEkDuLFeoEqhTRVw@mail.gmail.com>
To: linux-cachefs@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 03 Mar 2022 08:22:19 -0500
Subject: [Linux-cachefs] [BUG] write but no read when using sync mount option
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While trying the new FS-Cache implementation using the 5.17-rc5 kernel on
Ubuntu 21.10 I ran into an issue where it appears that FS-Cache was not being
used when the sync mount option is enabled.

While monitoring /proc/fs/fscache/stats it was observed there were high writes
to the cache volume, but no reads:

    IO     : rd=0 wr=344713665

Further tracing of /sys/kernel/debug/tracing/events/fscache/fscache_access shows
a large number of io_write operations, but no io_read operations.

The volume did fill up and perform culling as expected.

When the mount option was changed from sync to async the cache performed as
expected and a mixture of io_write and io_read was observed.

-- Chris

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


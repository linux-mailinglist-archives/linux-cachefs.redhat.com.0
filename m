Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DECCF322AFA
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Feb 2021 14:00:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-p_0JuyspMfuPzAAFHmNpSQ-1; Tue, 23 Feb 2021 08:00:30 -0500
X-MC-Unique: p_0JuyspMfuPzAAFHmNpSQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BEA11005501;
	Tue, 23 Feb 2021 13:00:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F56719C46;
	Tue, 23 Feb 2021 13:00:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7947918089D9;
	Tue, 23 Feb 2021 13:00:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11ND0IJ5009197 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Feb 2021 08:00:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 818E6114B2E7; Tue, 23 Feb 2021 13:00:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D36D1004163
	for <linux-cachefs@redhat.com>; Tue, 23 Feb 2021 13:00:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82B61100AFE1
	for <linux-cachefs@redhat.com>; Tue, 23 Feb 2021 13:00:15 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
	[209.85.167.177]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-289-zFzOyrbbPwO3a6ykoQWkWA-1; Tue, 23 Feb 2021 08:00:10 -0500
X-MC-Unique: zFzOyrbbPwO3a6ykoQWkWA-1
Received: by mail-oi1-f177.google.com with SMTP id j1so5537874oiw.3
	for <linux-cachefs@redhat.com>; Tue, 23 Feb 2021 05:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=3p9+EHvv7GSJoMrrTDz5v8yx0zmPlVwAIarwOkznWaA=;
	b=eP5aW4WQItuseqaFqaAY3hQzeeJYfmYuOCv/bpU53rwcLlPjhYIOldwxYg4Nh0KGw5
	QrNVsVqPUbF8p5gPEzvfuzO9LP3Ej56kAnsswn4wNurYpwFbjP8/RUSW6KCGM/J4S2xs
	SKIprNHowWxeWrTKLQ8zljWR5gDk41nY9eS+EVxc65ySKbWNzlYaaO3wff7PUb4fQQVJ
	5o80qYqgeJU3RN6CIPni4nzgPAnm4aRQjAVsFs7ZD4lbouIEAkqrtGK3x1zecIXcDMMu
	bVusPCSe+dZMcLN+QYyQw1uvB6euUHsTIMaMZwNUDB4SspY4GNCJouwaZLx8OGllR/MK
	qdlA==
X-Gm-Message-State: AOAM531azXJmnVN11pVmCIeK0rRAvePrvi+66qHs1H1qyAN3mG17JGDw
	UqEUxEa5aucP1DRIDtLn/ODf2WRrFzRP1Qey8wB/j/x0H8Y=
X-Google-Smtp-Source: ABdhPJw+fyKr5x3O/zASeR9w+SiNK8SRp5Qq9/JJ4x7J6E/1Cvbf7JY8QiJ+k7LydG3rR2volfyRXJhOiKKuS8kPTvw=
X-Received: by 2002:aca:534c:: with SMTP id h73mr15443581oib.75.1614085209258; 
	Tue, 23 Feb 2021 05:00:09 -0800 (PST)
MIME-Version: 1.0
From: Jan Krcmar <honza801@gmail.com>
Date: Tue, 23 Feb 2021 13:59:58 +0100
Message-ID: <CAKneAXnd-qYteMM5iZxxNjd3rRHfxo9YNY-idXRZNStzdD7+Cw@mail.gmail.com>
To: linux-cachefs@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Subject: [Linux-cachefs] How to use FS-Cache with CacheFS (not CacheFiles)
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

hi,

according to this documentation:
https://www.kernel.org/doc/html/latest/filesystems/caching/fscache.html

have you any hint how to setup fs-cache with raw device (aka cachefs).
all the documents i've found describe process of setting up with
cachefilesd. fe.
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/managing_file_systems/getting-started-with-fs-cache_managing-file-systems

https://en.wikipedia.org/wiki/CacheFS
"CacheFS is a Filesystem for the FS-Cache facility. A block device can
be used as cache by simply mounting it. Needs no special activation
and is deactivated by unmounting it. "

are these informations correct? is it possible to setup fs-cache with
block device?

thanks
jan

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


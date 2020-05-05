Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDBA1C5B24
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 May 2020 17:29:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588692542;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Rvb9gggUParI3tRUAv5k08kTdQ9qYZYXatBe5XBboLE=;
	b=az7S3PmaomCSRs5sc/8WaQMGfOHHW0fiGeth+ewk3gb/hELVH6C3678LWTaazK/4Iw5ZuL
	D9Tcxhe/mtR2ugtoeqX0ChKLzeJGfOt/qdFud685WnsjLeBSuNfR1GwhxGTYXeiDYgO+6D
	LFYqJxyqvqYicah30JU2bOgt0K27k8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-qxHd4AkSPyKWkR9IaAhzew-1; Tue, 05 May 2020 11:28:59 -0400
X-MC-Unique: qxHd4AkSPyKWkR9IaAhzew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 979601005510;
	Tue,  5 May 2020 15:28:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A2836061C;
	Tue,  5 May 2020 15:28:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A12D1809542;
	Tue,  5 May 2020 15:28:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 045FSkMT025882 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 5 May 2020 11:28:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 50D7917338; Tue,  5 May 2020 15:28:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D0BA11316
	for <linux-cachefs@redhat.com>; Tue,  5 May 2020 15:28:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34DBF833B45
	for <linux-cachefs@redhat.com>; Tue,  5 May 2020 15:28:44 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-424-e-kuD4cXNcmrHDubgQReMw-1;
	Tue, 05 May 2020 11:28:41 -0400
X-MC-Unique: e-kuD4cXNcmrHDubgQReMw-1
Received: from lwn.net (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E0CF5737;
	Tue,  5 May 2020 15:28:39 +0000 (UTC)
Date: Tue, 5 May 2020 09:28:38 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <20200505092838.4b1ff075@lwn.net>
In-Reply-To: <20200428130128.22c4b973@lwn.net>
References: <cover.1588021877.git.mchehab+huawei@kernel.org>
	<20200428130128.22c4b973@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 045FSkMT025882
X-loop: linux-cachefs@redhat.com
Cc: codalist@telemann.coda.cs.cmu.edu,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-cachefs] [PATCH v3 00/29] Convert files to ReST - part 2
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 28 Apr 2020 13:01:28 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> So I'm happy to merge this set, but there is one thing that worries me a
> bit... 
> 
> >  fs/cachefiles/Kconfig                         |    4 +-
> >  fs/coda/Kconfig                               |    2 +-
> >  fs/configfs/inode.c                           |    2 +-
> >  fs/configfs/item.c                            |    2 +-
> >  fs/fscache/Kconfig                            |    8 +-
> >  fs/fscache/cache.c                            |    8 +-
> >  fs/fscache/cookie.c                           |    2 +-
> >  fs/fscache/object.c                           |    4 +-
> >  fs/fscache/operation.c                        |    2 +-
> >  fs/locks.c                                    |    2 +-
> >  include/linux/configfs.h                      |    2 +-
> >  include/linux/fs_context.h                    |    2 +-
> >  include/linux/fscache-cache.h                 |    4 +-
> >  include/linux/fscache.h                       |   42 +-
> >  include/linux/lsm_hooks.h                     |    2 +-  
> 
> I'd feel a bit better if I could get an ack or two from filesystem folks
> before I venture that far out of my own yard...what say you all?

It's been another week and nobody has complained, so I'm taking that as
assent; the series has been applied.

Thanks,

jon


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


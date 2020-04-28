Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4A01C3712
	for <lists+linux-cachefs@lfdr.de>; Mon,  4 May 2020 12:39:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588588763;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OOWitoSMZQqqXB4hx+QwzdqJfiqCAJFZKGYt98pQZ/g=;
	b=Gbm7AjSlFd7F0ZNW4qcsxEhvWU/Vxc+QdpUrG8rU+N571qVS81sC1ClMFogvf1ETHzzjsy
	Pzvd4QPo1anrT2EAP5owBfY8orar3OxIxGqsmzYn2FHEk7GVw0fxddcHUeEoLASHTpQW3g
	/BTpxkLwj+kqzLCYmGYwQN9+w+IsB0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255--RlPyYR4Mb2d5JIviXxuWA-1; Mon, 04 May 2020 06:39:21 -0400
X-MC-Unique: -RlPyYR4Mb2d5JIviXxuWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E180A835B40;
	Mon,  4 May 2020 10:39:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EF9F10016DA;
	Mon,  4 May 2020 10:39:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 692D81809540;
	Mon,  4 May 2020 10:39:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03SJ1bVe032055 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 15:01:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2AA69C6116; Tue, 28 Apr 2020 19:01:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 274BDD0187
	for <linux-cachefs@redhat.com>; Tue, 28 Apr 2020 19:01:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 239F2801030
	for <linux-cachefs@redhat.com>; Tue, 28 Apr 2020 19:01:35 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-200--T0B4qVRP7Opm-UuVfg_Sg-1;
	Tue, 28 Apr 2020 15:01:31 -0400
X-MC-Unique: -T0B4qVRP7Opm-UuVfg_Sg-1
Received: from lwn.net (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9121944A;
	Tue, 28 Apr 2020 19:01:29 +0000 (UTC)
Date: Tue, 28 Apr 2020 13:01:28 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <20200428130128.22c4b973@lwn.net>
In-Reply-To: <cover.1588021877.git.mchehab+huawei@kernel.org>
References: <cover.1588021877.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03SJ1bVe032055
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 04 May 2020 06:39:10 -0400
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 27 Apr 2020 23:16:52 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> This is the second part of a series I wrote sometime ago where I manually
> convert lots of files to be properly parsed by Sphinx as ReST files.
> 
> As it touches on lot of stuff, this series is based on today's linux-next, 
> at tag next-20190617.
> 
> The first version of this series had 57 patches. The first part with 28 patches
> were already merged. Right now, there are still ~76  patches pending applying
> (including this series), and that's because I opted to do ~1 patch per converted
>  directory.
> 
> That sounds too much to be send on a single round. So, I'm opting to split
> it on 3 parts for the conversion, plus a final patch adding orphaned books
> to existing ones. 
> 
> Those patches should probably be good to be merged either by subsystem
> maintainers or via the docs tree.

So I'm happy to merge this set, but there is one thing that worries me a
bit... 

>  fs/cachefiles/Kconfig                         |    4 +-
>  fs/coda/Kconfig                               |    2 +-
>  fs/configfs/inode.c                           |    2 +-
>  fs/configfs/item.c                            |    2 +-
>  fs/fscache/Kconfig                            |    8 +-
>  fs/fscache/cache.c                            |    8 +-
>  fs/fscache/cookie.c                           |    2 +-
>  fs/fscache/object.c                           |    4 +-
>  fs/fscache/operation.c                        |    2 +-
>  fs/locks.c                                    |    2 +-
>  include/linux/configfs.h                      |    2 +-
>  include/linux/fs_context.h                    |    2 +-
>  include/linux/fscache-cache.h                 |    4 +-
>  include/linux/fscache.h                       |   42 +-
>  include/linux/lsm_hooks.h                     |    2 +-

I'd feel a bit better if I could get an ack or two from filesystem folks
before I venture that far out of my own yard...what say you all?

Thanks,

jon


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D58AD97F
	for <lists+linux-cachefs@lfdr.de>; Mon,  9 Sep 2019 14:58:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB3B0300DA3A;
	Mon,  9 Sep 2019 12:58:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D36C16012D;
	Mon,  9 Sep 2019 12:58:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B348724F30;
	Mon,  9 Sep 2019 12:58:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x89CwaoY018567 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 9 Sep 2019 08:58:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8FC6160BF3; Mon,  9 Sep 2019 12:58:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A02060BE2
	for <linux-cachefs@redhat.com>; Mon,  9 Sep 2019 12:58:34 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AAAE6308427D
	for <linux-cachefs@redhat.com>; Mon,  9 Sep 2019 12:58:32 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n10so14573154wmj.0
	for <linux-cachefs@redhat.com>; Mon, 09 Sep 2019 05:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=STwRsrSKAt8kUvh7h/tHrOrLaqwQp0Z1Y8I/B385tnI=;
	b=YupjZuQ1rXvd0vMHoxIhQLcRpPQe6buVHwUvpPjR1/wpvxRHcWPJO/A8I46B+hWL71
	7qswMB87DQOPQM7YoPCGGA/yawhTwL6DrRDkz5F+HHSJwizOFDA182aOUY0Pb0jwCO7d
	A+b69mmkEzjK6e6qtRVCuQSpC5lE/rjQRFDfsrTEkDhdeA5/SS71o11pQKHw2/CCYFGN
	IeauwqgjsuRINyGFFiyiZQLVbDuB90CZBBmQieUDT2cZKl4N/ghNsC2Tp0BZ8E1/HBN5
	mw1ZEKoTFH+TJfrIXIQ4NcW7kkZ6JpTuE0Q/S7prDAddQHbaCMV58BK2MbIAIXqhHU2X
	9UiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=STwRsrSKAt8kUvh7h/tHrOrLaqwQp0Z1Y8I/B385tnI=;
	b=U+6KwNh3gy6agRSe63ftC5zoKg6IhLCsbA3fhddVnajZgSwHFgIedkHbwu7HyyEmp8
	GI6AhYMv0mm6Y5G0xIFSOopD0OYOiH3ZycfbTlgEGb2+4dwzymtvFFadzYufXQjrmKdT
	Js+0qKxMa72MltlCJTfqH7C0U0ERg2trG3WHfSRkBXolgKSK8ykGPV42KS+4HSlxY41Y
	nozc1e1pUWAnBTRt5ezE5v7FhjC3Pu4JGSIRkulSO57h5jfeR3wc1SLaki+wBUndiYP0
	yJkGsoKSY2F21Jp4hD62kmw5EDZx+N3rnf8ZB/QXlsK8Utjb4ENl1eyHubuT62mXyb1f
	7TFQ==
X-Gm-Message-State: APjAAAUBYxWJfJWzGFtbnA1QsU7R6HeOeZ967ge3gE7XkufRtZceUMRB
	Uy+tzmyA7xzcQOFZ1U8o/McMno/4JMLxihmcD2DsdQ==
X-Google-Smtp-Source: APXvYqw/wFm+1os0T7iuG+qLxDlNJHCzM1XTRHdaISkB1uGz/8LWzvVXdcxuRcq6cTy41Okp+bo0xTJRi05t1kWfjaA=
X-Received: by 2002:a1c:c013:: with SMTP id q19mr17159493wmf.87.1568033911040; 
	Mon, 09 Sep 2019 05:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAB3bAB8a+bXvWPNBFss7K79qVy6UnFC69q+fv4eF9Mog1uQH=Q@mail.gmail.com>
In-Reply-To: <CAB3bAB8a+bXvWPNBFss7K79qVy6UnFC69q+fv4eF9Mog1uQH=Q@mail.gmail.com>
From: Daire Byrne <daire.byrne@gmail.com>
Date: Mon, 9 Sep 2019 13:58:19 +0100
Message-ID: <CAB3bAB9G3aTd9ZW_UJomMARo3_8nwrDkFhYbyPcS8FJNSDDWdQ@mail.gmail.com>
To: linux-cachefs@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 09 Sep 2019 12:58:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Mon, 09 Sep 2019 12:58:33 +0000 (UTC) for IP:'209.85.128.66'
	DOMAIN:'mail-wm1-f66.google.com' HELO:'mail-wm1-f66.google.com'
	FROM:'daire.byrne@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.124  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.66 mail-wm1-f66.google.com 209.85.128.66
	mail-wm1-f66.google.com <daire.byrne@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [Linux-cachefs] nfsv4 client not reading the cache?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 09 Sep 2019 12:58:39 +0000 (UTC)

Hi,

I still see this on 5.2.11. On further testing it seem like the RHEL7
kernels work as expected with vers=nfs4,fsc but the mainline kernels do
not. It writes the cache but then never reads from it again so we just keep
re-writing the cache.

Daire

On Sat, Apr 6, 2019 at 10:15 AM Daire Byrne <daire.byrne@gmail.com> wrote:

> Hi,
>
> I'm using the 5.0.5 ml kernel to mount a Linux server with nfsv4. When I
> enable fscache, it caches the reads to disk as expected. But as soon as I
> drop_caches on the client and re-read the same data, it caches to disk
> again, seemingly overwriting the previously cached files.
>
> It works as expected if I mount using nfsv3 instead - after dropping
> caches (or rebooting), it correctly reads the cached files from disk
> without re-writing them again.
>
> I am using the 5.0.5 kernel on a Centos 7.4 installation. The mount
> command is "mount -o vers=4.2,fsc blah:/thing /thing".
>
> Daire
>
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

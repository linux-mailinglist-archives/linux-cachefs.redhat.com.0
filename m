Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF7ACFCDD
	for <lists+linux-cachefs@lfdr.de>; Tue,  8 Oct 2019 16:55:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5861883C3C;
	Tue,  8 Oct 2019 14:55:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5E6A6012A;
	Tue,  8 Oct 2019 14:55:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1881024F30;
	Tue,  8 Oct 2019 14:55:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x97IVwfC003814 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 7 Oct 2019 14:31:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F33D819C77; Mon,  7 Oct 2019 18:31:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mx1.redhat.com (ext-mx26.extmail.prod.ext.phx2.redhat.com
	[10.5.110.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE2A519C69
	for <linux-cachefs@redhat.com>; Mon,  7 Oct 2019 18:31:55 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
	[209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF0D3800DF4
	for <linux-cachefs@redhat.com>; Mon,  7 Oct 2019 18:31:54 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id k20so12600607oih.3
	for <linux-cachefs@redhat.com>; Mon, 07 Oct 2019 11:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=oyGu9Opm8iOgVeHA4434DG4h5FzvS3S5Ny62iA8pN1Q=;
	b=g72LHai9UzWLX8FYZrZ6b4DErZc166+raq6lVD5yGlDu15YRuLCKI+GqKS8gITT+BB
	8luUw4DLYSqm76oqAYADfiD7F26WB8XX0H18m2v0eWKRJc6X1m04Vr94DA9n3eVtFOhO
	1MUeDMkWJQSit7as7Hp4Shadqt3uXejOVFfqO0B26EMI3K/OFzUPDLVxmTVn4TIiEAfy
	K40En1ZBAOGgEW+TC6mMnX2n7yuOM+EnTdrXCTJpoPN1kyHC6TOMJu/dPTbyn7Knn6G8
	cWglLb8sAFRB5iKyxbZtlNpxs2uFiIfXK5gMEqYtc8pcXwO3CfKw4STHyKPbzvSm/n6L
	o2jA==
X-Gm-Message-State: APjAAAXoWlxlDRNK64Zyg0rQFnsBit9L7kN1/TnCR+guWfMsDs8eQ1TN
	IyBWCsGem2jNQhNNN1pFIZflS2VxzwaMBf0blRHoHA==
X-Google-Smtp-Source: APXvYqwbR03CpkpMy29sAdeweUknhlBdN6wKL51J6KaO4W4pm7n+znub/gw1LawrBgkT/5sYw0iBPowYwVaXIkkWZHg=
X-Received: by 2002:aca:645:: with SMTP id 66mr506491oig.117.1570473114012;
	Mon, 07 Oct 2019 11:31:54 -0700 (PDT)
MIME-Version: 1.0
From: Igor Feghali <ifeghali@php.net>
Date: Mon, 7 Oct 2019 15:31:17 -0300
Message-ID: <CAMPaRyzD1XzT=NYtYV=V0XykFjpvZAOPnvMm+mBu_nrK+wOpNA@mail.gmail.com>
To: linux-cachefs@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.67]);
	Mon, 07 Oct 2019 18:31:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]);
	Mon, 07 Oct 2019 18:31:55 +0000 (UTC) for IP:'209.85.167.176'
	DOMAIN:'mail-oi1-f176.google.com'
	HELO:'mail-oi1-f176.google.com' FROM:'igor.feghali@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.251  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.167.176 mail-oi1-f176.google.com 209.85.167.176
	mail-oi1-f176.google.com <igor.feghali@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.67
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 08 Oct 2019 10:54:45 -0400
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [Linux-cachefs] highly available nfs cache
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]); Tue, 08 Oct 2019 14:55:50 +0000 (UTC)

hi there

i am pretty new to cachefilesd, i can see it is performance driven but I am
wondering if there is a way to use it as a highly available cache, that is,
make my cached files readable even in case of a server blackout. any help
would be appreciated.

thanks
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

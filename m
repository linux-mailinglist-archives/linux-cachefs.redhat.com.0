Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6812844BCCE
	for <lists+linux-cachefs@lfdr.de>; Wed, 10 Nov 2021 09:25:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-5JVAn8R5MM-k4LG_5_aEZw-1; Wed, 10 Nov 2021 03:25:37 -0500
X-MC-Unique: 5JVAn8R5MM-k4LG_5_aEZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D62210168DE;
	Wed, 10 Nov 2021 08:25:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBAD6794A7;
	Wed, 10 Nov 2021 08:25:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3D8E1832DD4;
	Wed, 10 Nov 2021 08:25:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AA7uxNP008422 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 10 Nov 2021 02:56:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B9C2D404727C; Wed, 10 Nov 2021 07:56:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B60EA4047279
	for <linux-cachefs@redhat.com>; Wed, 10 Nov 2021 07:56:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CCBD85A5A8
	for <linux-cachefs@redhat.com>; Wed, 10 Nov 2021 07:56:59 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-439-4R17WJ7CO3adem0QAvGweg-1;
	Wed, 10 Nov 2021 02:56:55 -0500
X-MC-Unique: 4R17WJ7CO3adem0QAvGweg-1
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from uranus.localnet ([91.52.46.240]) by mail.gmx.net (mrgmx105
	[212.227.17.174]) with ESMTPSA (Nemesis) id 1M42nY-1mkiOe1OuO-0005Lp;
	Wed, 10 Nov 2021 08:51:52 +0100
From: Marco Diers <marco_diers@gmx.com>
To: linux-cachefs@redhat.com
Date: Wed, 10 Nov 2021 08:54:25 +0100
Message-ID: <3061889.JrG8lS4g9u@uranus>
MIME-Version: 1.0
X-Provags-ID: V03:K1:0WXuS/DOQBr7YefHVrxsPb22JmeQn+cp7+X4q+JxLsTydhuZG+o
	CDgXcJ3aPx207CkRQKfXtNZK2ZhjSfkG5pDI5MNBwdjbP+iPdJv7TPhogVFTtfmHzHiaTvk
	wa7LnWihwXiXL1/8HWwwXNOpo+IG5dYheOqmbCyp2t1WAj+LPA+klfOYicKzGO3Sa+xhnZz
	jUiECJFp5DBWq0iwgDCtA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aYwhWqdY3Xc=:1WPdsLtx77KbE9FBWjLBB+
	a72SLo/HCYDbJwrhF5LhMyRo6MepdrxKSr1Qga5Wv2+e2dKoWNAq8PEI40mIulZOKUTEDrIy4
	WhiA0h3dschXsdcEf4L6Ix63M6TbRphQ6HjseyAAUXg04mCifITkZW3c8Mg93vxNIWRQe/BoE
	ih1cDa0b8cc0ox9IG8UZH3wer28dqWAsBq4Z6p2S6463uQ9CLftVF4H0QVKfNSThdBWvGKeXg
	KHRrxwruQ1ulgaqBlwaziGbHaomr8uytBklwT9lKuZQCGLn00R8wj7qdyl+rheJn+AyR1vPCv
	oaQqsJnMjA8RG8yJaxepamgLeUnxGnB3muAZvaCWdiyfWfX3t61dIGFGDWITOpjPhKLbiTGsW
	5fbRsTR/L8jffC7N8uqXRxN8jCE8ZteK2w4hTrSJkzVdyJw+Eh91AHNUbbWCS1rRZN7dSBMqs
	MdN6c/UO95qVFSet5s44M9f0lKFfchYDjFOtEZm+82w4Q7/c2JGupEQ0QDVcN0bSSFyA8r6oh
	rVjIwThB/1gFnBwsk2DDGkgFghu7C/XnAme8JbwZuieXlT0ZQcqeJFXSZFGBBawUkPR7JDFbX
	mVifpZwTyw4MIGKo6P+cBu+1Tn7tsnXNJHPxGd2FQH9GfYFFPEDktUIfoAzlbOSK09zwUaD2r
	QFL1IlS+BZ6x1xnh/JWgLtyq+n7eu9a29lUxkJLx4RzjiIu7grISP8Ey8zDnUYHTq4w7JDQXO
	OkV1VN5ZMLj+4rAoJ0RJR9BQalnEtKWNVdWzpCun0iSI4vF63V+LZyLlHNA/vczBYu5drNiNs
	LL48O2hKzyJofwuDv6uL1+Fp7rTN9Q5fanypNTw8sEE6aGuOPW4l301vHpvv0IECJ8WmWdKmX
	oCML0ioutyf1nngHRZAVnrVXHfYBAnG82HLXK9b0oXDflKC2ificSi40uE70Y89scjGq7ioZL
	Frimiw475H7KKAbZJ/ogrnKGTHCZ4Kjki/+McNZkwKPMTOknsCb9TTvH5bcrp1VMcSJ4z6umQ
	l4WN2yM0SxwdFlA/wAHb1KU420qn5E1GZi0AN6g4q6G3Z8TfG1dy3w8g2dgrNUj7JxOtXGGoJ
	fSSjtPcHq97khE=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Wed, 10 Nov 2021 03:20:37 -0500
Subject: [Linux-cachefs] fscache: calculation of a cache hit ratio
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

how can i calculate a cache hit ratio from the values of /proc/fs/fscache/
stats. I can't find a solution for this.

With kind regards,

Marco



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


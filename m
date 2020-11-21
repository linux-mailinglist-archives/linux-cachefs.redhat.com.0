Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EE9BC2BBF51
	for <lists+linux-cachefs@lfdr.de>; Sat, 21 Nov 2020 14:50:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605966633;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XuWBySL3p0j5GoKrl1iJz/VbeKkWwSGneucrRUIqSy4=;
	b=bsZRH+BbE97GUTsm6Q8+gEVuOq78mRjla4/HxMqMWk1t8oBvnDCs1X+bIzk2cucAuQlAdC
	UgbdGJ00ctJOcNeDYUuLZBCdpO58SspjQ7VhkoTY6zp8pLlNvlF0HvuJgYuPavPBGJxlnR
	YD20NMABoq9nCXFD4a0rJjf9ffv7MR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-sjk6Ym4TMEquYcYbZhZjEw-1; Sat, 21 Nov 2020 08:50:31 -0500
X-MC-Unique: sjk6Ym4TMEquYcYbZhZjEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 228541842144;
	Sat, 21 Nov 2020 13:50:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B1FB5C224;
	Sat, 21 Nov 2020 13:50:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41E50180954D;
	Sat, 21 Nov 2020 13:50:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ALDoNrX003111 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 21 Nov 2020 08:50:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7494B2166B2B; Sat, 21 Nov 2020 13:50:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FFEC2166B28
	for <linux-cachefs@redhat.com>; Sat, 21 Nov 2020 13:50:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22516858EEC
	for <linux-cachefs@redhat.com>; Sat, 21 Nov 2020 13:50:21 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
	[209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-490-Hx3h-Xd_NL-LTn3D-ItqxQ-1; Sat, 21 Nov 2020 08:50:18 -0500
X-MC-Unique: Hx3h-Xd_NL-LTn3D-ItqxQ-1
Received: by mail-ej1-f72.google.com with SMTP id a9so4450415ejy.22
	for <linux-cachefs@redhat.com>; Sat, 21 Nov 2020 05:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Qo3vko8/4ulslzcxMhjEI2IEZSbC0l7+fhGhVifz+E0=;
	b=Z32jN8J/uPOHthK77rDNuIGzD5IwGjvHri4zPVFf4nwuCbFae7dlP6TA6+qRi8wsDT
	G+IRVZNnVNxG+//Uz/nItmfntRZUZE0bMEJpTMHxHmIKsdBaoUNLyr2cElLG7TJgFN/L
	wguBuC+8mLDMoAIQjonBmFj36PH5Wp3YtZtVTupA7dJUrFG4uGSOwc0y0ljrZwRD5V+H
	pb8wRPNeyrEr2sDR0prNfK1gi2OoD5u3xUPlzm+Blgi5ivjxxrmEK0NPA8aH3PSgd6cV
	m9h8e8i5mGWqJ/YRmu9tu1YSrtTpqQI/ZwpmzGHUogZp8N/hezWHjJ7d09KHJ9OO5OVy
	V6XA==
X-Gm-Message-State: AOAM531JL637YhYgqFFU/k0xE32QvlSp3t3ep75nIl4JrROyJd2gQUjK
	XDTQpAFWbMWjK9wZueABvc0q46+KggrjZPwA1i92tM6fSsTDhPAGCCq2EnwH3g1pp35C+7wVY83
	QrYfzbv2Um1T6RE2aWa6quOdxO8MhDVSfRGaxaA==
X-Received: by 2002:a17:906:2f87:: with SMTP id
	w7mr39822382eji.83.1605966616777; 
	Sat, 21 Nov 2020 05:50:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlni8rG3+NM+u9g1/N/NxTIZRrAFpEYKFll0RsRX/pjO8p9UkqU4Vhpi5acYGaaPWVo65Ui1LIebGIt3vEgBQ=
X-Received: by 2002:a17:906:2f87:: with SMTP id
	w7mr39822376eji.83.1605966616591; 
	Sat, 21 Nov 2020 05:50:16 -0800 (PST)
MIME-Version: 1.0
From: David Wysochanski <dwysocha@redhat.com>
Date: Sat, 21 Nov 2020 08:49:39 -0500
Message-ID: <CALF+zOniUVE05=JnhHwqshq843rUH_Pm5gKewFL-oi3PFbLdMA@mail.gmail.com>
To: linux-cachefs@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Subject: [Linux-cachefs] NFS conversion to new netfs and fscache APIs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I just posted patches to linux-nfs but neglected to CC this list.  For
any interested in patches which convert NFS to use the new netfs and
fscache APIs, please see the following series on linux-nfs:
[PATCH v1 0/13] Convert NFS to new netfs and fscache APIs
https://marc.info/?l=linux-nfs&m=160596540022461&w=2

Thanks.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 19B3527B17D
	for <lists+linux-cachefs@lfdr.de>; Mon, 28 Sep 2020 18:11:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-UTh69nAnOZGm9NwWVD7E4g-1; Mon, 28 Sep 2020 12:11:39 -0400
X-MC-Unique: UTh69nAnOZGm9NwWVD7E4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FA57801AB4;
	Mon, 28 Sep 2020 16:10:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAE7460C05;
	Mon, 28 Sep 2020 16:10:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E3D344A4E;
	Mon, 28 Sep 2020 16:10:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08SGAZYh019619 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 28 Sep 2020 12:10:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4014E1112855; Mon, 28 Sep 2020 16:10:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B6AA1112856
	for <linux-cachefs@redhat.com>; Mon, 28 Sep 2020 16:10:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3868585829C
	for <linux-cachefs@redhat.com>; Mon, 28 Sep 2020 16:10:32 +0000 (UTC)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-81-3IxhDstgNMyebZzJb3TmHw-1; Mon, 28 Sep 2020 12:10:28 -0400
X-MC-Unique: 3IxhDstgNMyebZzJb3TmHw-1
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08SG9kSs138085; Mon, 28 Sep 2020 16:10:20 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2130.oracle.com with ESMTP id 33su5ap2th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 28 Sep 2020 16:10:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08SG4hnU040906; Mon, 28 Sep 2020 16:08:19 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3020.oracle.com with ESMTP id 33tfdqc93m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Sep 2020 16:08:19 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08SG8BTN011123;
	Mon, 28 Sep 2020 16:08:12 GMT
Received: from anon-dhcp-152.1015granger.net (/68.61.232.219)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 28 Sep 2020 09:08:10 -0700
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <20200928154949.GA14702@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
Date: Mon, 28 Sep 2020 12:08:09 -0400
Message-Id: <B38FC84D-2658-47A6-9531-EFB6D0A64D4A@oracle.com>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<20200915172140.GA32632@fieldses.org>
	<2001715792.39705019.1600358470997.JavaMail.zimbra@dneg.com>
	<20200917190931.GA6858@fieldses.org>
	<20200917202303.GA29892@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
	<76A4DC7D-D4F7-4A17-A67D-282E8522132A@oracle.com>
	<1790619463.44171163.1600892707423.JavaMail.zimbra@dneg.com>
	<20200923210157.GA1650@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
	<108670779.52656705.1601110822013.JavaMail.zimbra@dneg.com>
	<20200928154949.GA14702@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
To: Frank van der Linden <fllinden@amazon.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9758
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
	phishscore=0
	adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0
	suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009280123
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9758
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
	suspectscore=0
	lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0 impostorscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009280124
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08SGAZYh019619
X-loop: linux-cachefs@redhat.com
Cc: Bruce Fields <bfields@fieldses.org>, Daire Byrne <daire@dneg.com>,
	linux-cachefs <linux-cachefs@redhat.com>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>
Subject: Re: [Linux-cachefs] Adventures in NFS re-exporting
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On Sep 28, 2020, at 11:49 AM, Frank van der Linden <fllinden@amazon.com> wrote:
> 
> Bruce - if you want me to 'formally' submit a version of the patch, let me
> know. Just disabling the cache for v4, which comes down to reverting a few
> commits, is probably simpler - I'd be able to test that too.

I'd be interested in seeing that. From what I saw, the mechanics of
unhooking the cache from NFSv4 simply involve reverting patches, but
there appear to be some recent changes that depend on the open
filecache that might be difficult to deal with, like

b66ae6dd0c30 ("nfsd: Pass the nfsd_file as arguments to nfsd4_clone_file_range()")


--
Chuck Lever




--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


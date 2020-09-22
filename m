Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 42D1427894C
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Sep 2020 15:19:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-0JQymQJlP6WSlWAUIK03YA-1; Fri, 25 Sep 2020 09:19:05 -0400
X-MC-Unique: 0JQymQJlP6WSlWAUIK03YA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A358280EF9D;
	Fri, 25 Sep 2020 13:19:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9380060C15;
	Fri, 25 Sep 2020 13:19:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 25F261826D2F;
	Fri, 25 Sep 2020 13:19:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08MHQaLf020292 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 22 Sep 2020 13:26:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E8D4720182A5; Tue, 22 Sep 2020 17:26:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2B502022790
	for <linux-cachefs@redhat.com>; Tue, 22 Sep 2020 17:26:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73A59186E136
	for <linux-cachefs@redhat.com>; Tue, 22 Sep 2020 17:26:33 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-417-PvNYkFKTN4ePWxrz5ljDzA-1; Tue, 22 Sep 2020 13:26:31 -0400
X-MC-Unique: PvNYkFKTN4ePWxrz5ljDzA-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08MGdA3H092283; Tue, 22 Sep 2020 16:43:29 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2120.oracle.com with ESMTP id 33q5rgc981-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 22 Sep 2020 16:43:29 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08MGduV1040266; Tue, 22 Sep 2020 16:43:29 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3020.oracle.com with ESMTP id 33nuw4cec6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Sep 2020 16:43:29 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08MGhQob029834;
	Tue, 22 Sep 2020 16:43:26 GMT
Received: from anon-dhcp-152.1015granger.net (/68.61.232.219)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 22 Sep 2020 09:43:25 -0700
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <20200917202303.GA29892@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
Date: Tue, 22 Sep 2020 12:43:24 -0400
Message-Id: <76A4DC7D-D4F7-4A17-A67D-282E8522132A@oracle.com>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<20200915172140.GA32632@fieldses.org>
	<2001715792.39705019.1600358470997.JavaMail.zimbra@dneg.com>
	<20200917190931.GA6858@fieldses.org>
	<20200917202303.GA29892@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
To: Frank van der Linden <fllinden@amazon.com>,
	Bruce Fields <bfields@fieldses.org>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752
	signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	phishscore=0 malwarescore=0
	mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009220128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752
	signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	impostorscore=0
	clxscore=1011 suspectscore=0 phishscore=0 malwarescore=0
	priorityscore=1501 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
	lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009220128
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08MHQaLf020292
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 25 Sep 2020 09:15:59 -0400
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
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



> On Sep 17, 2020, at 4:23 PM, Frank van der Linden <fllinden@amazon.com> wrote:
> 
> On Thu, Sep 17, 2020 at 03:09:31PM -0400, bfields wrote:
>> 
>> On Thu, Sep 17, 2020 at 05:01:11PM +0100, Daire Byrne wrote:
>>> 
>>> ----- On 15 Sep, 2020, at 18:21, bfields bfields@fieldses.org wrote:
>>> 
>>>>> 4) With an NFSv4 re-export, lots of open/close requests (hundreds per
>>>>> second) quickly eat up the CPU on the re-export server and perf top
>>>>> shows we are mostly in native_queued_spin_lock_slowpath.
>>>> 
>>>> Any statistics on who's calling that function?
>>> 
>>> I've always struggled to reproduce this with a simple open/close simulation, so I suspect some other operations need to be mixed in too. But I have one production workload that I know has lots of opens & closes (buggy software) included in amongst the usual reads, writes etc.
>>> 
>>> With just 40 clients mounting the reexport server (v5.7.6) using NFSv4.2, we see the CPU of the nfsd threads increase rapidly and by the time we have 100 clients, we have maxed out the 32 cores of the server with most of that in native_queued_spin_lock_slowpath.
>> 
>> That sounds a lot like what Frank Van der Linden reported:
>> 
>>        https://lore.kernel.org/linux-nfs/20200608192122.GA19171@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com/
>> 
>> It looks like a bug in the filehandle caching code.
>> 
>> --b.
> 
> Yes, that does look like the same one.
> 
> I still think that not caching v4 files at all may be the best way to go
> here, since the intent of the filecache code was to speed up v2/v3 I/O,
> where you end up doing a lot of opens/closes, but it doesn't make as
> much sense for v4.
> 
> However, short of that, I tested a local patch a few months back, that
> I never posted here, so I'll do so now. It just makes v4 opens in to
> 'long term' opens, which do not get put on the LRU, since that doesn't
> make sense (they are in the hash table, so they are still cached).
> 
> Also, the file caching code seems to walk the LRU a little too often,
> but that's another issue - and this change keeps the LRU short, so it's
> not a big deal.
> 
> I don't particularly love this patch, but it does keep the LRU short, and
> did significantly speed up my testcase (by about 50%). So, maybe you can
> give it a try.
> 
> I'll also attach a second patch, that converts the hash table to an rhashtable,
> which automatically grows and shrinks in size with usage. That patch also
> helped, but not by nearly as much (I think it yielded another 10%).

For what it's worth, I applied your two patches to my test server, along
with my patch that force-closes cached file descriptors during NFSv4
CLOSE processing. The patch combination improves performance (faster
elapsed time) for my workload as well.


--
Chuck Lever




--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

